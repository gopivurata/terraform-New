variable "region" {
    type        = string
    description = "(optional) region where the resources will be created"
    default     = "us-west-2"
}

variable "vpc_cidr" {
    type = string
}

variable "subnet_cidr" {
    type = string
}

variable "names" {
  type = string
}

variable "az" {
    type = string
}
variable "ami_id" {
    type = string
}

variable "port" {
    type = list(string)
}

variable "protocol" {
    type = list(string)
}

variable "volume" {
    type = string
}

variable "instance_type" {
    type = string
}
variable "key_name" {
  type = string
}

variable "desired" {
    type = string
}

variable "min" {
    type = string
}

variable "max" {
    type = string
}

variable "health_check_period" {
    type = string
}

variable "healthy_threshold" {
    type = string
}

variable "interval" {
    type = string
}

variable "lb_type" {
    type = string
}


variable "health_check_type" {
    type = string
}

variable "ip_type" {
  type = string
}

variable "target_type" {
  type = string
}

