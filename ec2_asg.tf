module "app_ec2_asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "~> 6.5.1"
  create  = true
  # Autoscaling group
  name                      = var.app_ec2_asg_name
  instance_name             = "${var.app_instance_name}-${var.app_environment}"
  min_size                  = 2
  max_size                  = 2
  desired_capacity          = 2
  wait_for_capacity_timeout = 0
  default_cooldown          = 600
  target_group_arns         = module.alb.target_group_arns
  health_check_type         = "EC2"
  vpc_zone_identifier       = module.app_vpc.public_subnets
  security_groups           = [module.app_sg.security_group_id]
  user_data                 = local.ec2_userdata_scripts
  # Launch template
  launch_template_name        = var.app_ec2_launch_template_name
  launch_template_description = "APP EC2 Launch template "
  create_launch_template      = true
  update_default_version      = true
  image_id                    = data.aws_ami.amazon_linux_2.id
  instance_type               = var.app_instance_type
  ebs_optimized               = true
  enable_monitoring           = true
  key_name                    = module.ec2_key_pair.key_pair_key_name
  disable_api_termination     = true
  iam_instance_profile_name   = aws_iam_instance_profile.ec2_s3_access_profile.name
  scaling_policies = {
    my-policy = {
      policy_type = "TargetTrackingScaling"
      target_tracking_configuration = {
        predefined_metric_specification = {
          predefined_metric_type = "ASGAverageCPUUtilization"
        }
        target_value = 50.0
      }
    }
  }
  block_device_mappings = [
    {
      # Root volume
      device_name = "/dev/xvda"
      no_device   = 0
      ebs = {
        delete_on_termination = true
        encrypted             = true
        volume_size           = 20
        volume_type           = "gp2"
      }
    }
  ]

  metadata_options = {
    http_endpoint               = "enabled"
    http_tokens                 = "required"
    http_put_response_hop_limit = 5
  }

  tags = {
    vpc_name    = "${var.app_vpc_name}"
    app_name    = "${var.app_name}"
    Environment = "${var.app_environment}"
    Terraform   = "true"
  }
  depends_on = [
    module.app_sg,
    module.app_vpc
  ]

}

