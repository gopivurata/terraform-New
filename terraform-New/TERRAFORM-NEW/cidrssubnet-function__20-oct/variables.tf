variable "region" {
    type        = string
    description = "(optional) region where the resources will be created"
    default     = "us-west-2"
}

variable "vpc_cidr" {
    type        = string
    default     = "10.10.0.0/16"
}

variable "subnet_azs" {
    type        = list(string)
}

variable "subnet_name_tags" {
    type        = list(string)
}