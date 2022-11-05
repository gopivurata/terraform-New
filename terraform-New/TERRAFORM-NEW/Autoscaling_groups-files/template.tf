# creating Template
resource "aws_launch_template" "my-template" {
  name = "my-template"
  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = var.volume
    }
  }

  network_interfaces {
    subnet_id = aws_subnet.temp-sub.id
    security_groups = [aws_security_group.temp_sec.id]
    associate_public_ip_address = true
  }

   instance_type = var.instance_type
   key_name = var.key_name
   image_id = var.ami_id
   placement {
    availability_zone = var.az
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = var.names
    }
  }

}
