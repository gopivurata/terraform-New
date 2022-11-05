variable "region" {
  type = string
  default = "us-west-2"
}

variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "pvt_cidrs" {
  type = list(string)
}

variable "pub_cidrs" {
  type = list(string)
}


