variable "app" { }

variable "stack" { }

variable "env" { }

variable "vpc_id" { }

variable "vpn_sg" { }

variable "ent_tools_sg_id" { }

variable "key_name" { }

variable "ami_id" { }

variable "instance_type" { }

variable "instance_profile" { }

variable "tls_cert_arn" { }

variable "nat_gw_cdir" { }

variable "bucket_name" { }

variable "asg_min" { }

variable "asg_max" { }

variable "asg_desired" { }

variable "ci_cidrs" {
  type = "list"
}
