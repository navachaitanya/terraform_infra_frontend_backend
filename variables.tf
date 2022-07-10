variable "vpc_region" {
  description = "AWS Region for deployment"
  default     = "ap-south-1"
}
variable "accepter_region" {
  description = "AWS Acceptor Region"
  default     = "ap-south-1"
}
variable "requester_vpc_id" {
  type        = string
  description = "Requester VPC ID"
  default     = "module.app_vpc.vpc_id"
}
variable "app_vpc_name" {
  description = "Application VPC Name"
}
variable "app_vpc_cidr_block" {
  description = "VPC CIDR BLOCK"
}
variable "app_environment" {
  description = "Deployment environment"
}
variable "app_name" {
  description = "Application Name"
}
variable "app_availability_zones" {
  description = "app_availability_zones"
}
variable "app_public_subnets" {
  description = "app_public_subnets"
}
variable "app_private_subnets" {
  description = "Private Subnets"
}
variable "app_db_subnets" {
  description = "Database Subnets"
}
variable "app_instance_type" {
  description = "App EC2 instance type"
}
variable "appload_balancer_type" {
  description = "App Loadbalancer type"
}
variable "app_ec2_sg_name" {
  description = "EC2 Security Group name"
}
variable "app_alb_sg_name" {
  description = "Application Loadbalancer Security Group name"
}

variable "root_block_device_volume_type" {
  description = "root_block_device volume type"
  type        = string
  default     = "gp2"
}
variable "root_block_device_volume_size" {
  description = "root_block_device volume Size"
  type        = string
  default     = "30"
}
variable "app_ec2_monitoring" {
  description = "app_ec2_monitoring"
}
variable "app_load_balancer_scheme_type" {
  description = "app_load_balancer_scheme_type"
  type        = bool
  default     = false
}
variable "app_loadbalancer_name" {
  description = "app_loadbalancer_name"

}
variable "rds_identifier_name" {
  description = "rds_identifier_name"

}
variable "rds_identifier_instance_type" {
  description = "rds_identifier_instance_type"

}
variable "rds_storage_size" {
  description = "rds_storage_size"

}
variable "rds_storage_size_max" {
  description = "rds_storage_size"

}
variable "rds_name" {
  description = "rds_name"

}
variable "rds_username" {
  description = "rds_username"

}
variable "rds_password" {
  description = " "

}
variable "rds_multi_az" {
  description = "rds_multi_az"

}
variable "rds_db_subnet_group_name" {
  description = "rds_db_subnet_group_name"

}
variable "rds_parameter_group_name" {
  description = "rds_parameter_group_name"

}
variable "rds_family" {
  description = "rds_family"

}
variable "rds_engine" {
  description = "rds_engine"

}
variable "rds_engine_version" {
  description = "rds_engine_version"

}
variable "rds_sg_name" {
  description = "rds_sg_name"
}

variable "public_s3_bucket_name" {
  description = "public_s3_bucket_name"
}
variable "public_s3_bucket_acl" {
  description = "public_s3_bucket_acl"
}
variable "public_s3_bucket_versioning" {
  description = "public_s3_bucket_versioning"
}
variable "private_s3_logs_bucket_name" {
  description = "private_s3_logs_bucket_name"
}
variable "private_s3_logs_bucket_acl" {
  description = "private_s3_logs_bucket_acl"
}
variable "private_s3_logs_bucket_versioning" {
  description = "private_s3_logs_bucket_versioning"
}

variable "ec2_ssh_public_key" {
  description = "EC2 Keypair for SSH connectivity"
}
variable "private_s3_bucket_name" {
  description = "private_s3_bucket_name"
}
variable "private_s3_bucket_acl" {
  description = "private_s3_bucket_acl"
}
variable "private_s3_bucket_versioning" {
  description = "private_s3_bucket_versioning"
}
##############ASG_VARIABLES##################
variable "app_ec2_launch_template_name" {
  description = "EC2 ASG Launch template name"
}

variable "app_ec2_asg_name" {
  description = "EC2 ASG name"
}

variable "app_instance_name" {
  description = "Auto Scaling group Instance name"

}
