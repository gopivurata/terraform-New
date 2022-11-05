locals {
  az_a            = format("%sa",var.region)
  az_b            = format("%sb",var.region)
  tcp             = "tcp"
  anywhere        = "0.0.0.0/0"
  msql_port       = 3306
  db_subnet1      = 0
  db_subnet2      = 1
  app_subnet1     = 2
  app_subnet2     = 3
}