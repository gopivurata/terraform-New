resource "aws_key_pair" "ssh_key" {
   key_name = var.key_name
   public_key = file("C:/Users/gopiv/.ssh/id_rsa.pub")
  
}