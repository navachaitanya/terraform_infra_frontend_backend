module "app_rds_sg" {
  source       = "terraform-aws-modules/security-group/aws"
  version      = "~> 4.9.0"
  create       = true
  name         = "${var.app_name}-${var.rds_sg_name}-${var.app_environment}"
  description  = "Security group for user-service with custom ports open within VPC"
  vpc_id       = module.app_vpc.vpc_id
  egress_rules = ["all-all"]
  ingress_with_cidr_blocks = [
    {
      from_port   = 5432
      to_port     = 5432
      protocol    = "tcp"
      description = "User-service ports"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      rule        = "all-all"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  tags = {
    vpc_name    = "${var.app_vpc_name}"
    app_name    = "${var.app_name}"
    Environment = "${var.app_environment}"
    Terraform   = "true"
  }
  depends_on = [
    module.app_vpc,
    module.app_ec2_asg,
    module.app_sg,
    module.app_alb_sg
  ]
}
