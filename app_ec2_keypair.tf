#ssh keypair for the EC2
module "ec2_key_pair" {
  source          = "terraform-aws-modules/key-pair/aws"
  version         = "~> 1.0.1"
  create_key_pair = true
  key_name        = "${var.app_name}-ec2-keypair"
  public_key      = var.ec2_ssh_public_key
  tags = {
    Name        = "${var.app_name}-ec2-keypair"
    vpc_name    = "${var.app_vpc_name}"
    app_name    = "${var.app_name}"
    Environment = "${var.app_environment}"
    Terraform   = "true"
  }
}
