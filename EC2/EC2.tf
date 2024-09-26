resource "aws_instance" "app_server" {
  ami           = var.ami
  instance_type = var.type
  key_name = var.key_pair_name
  subnet_id = var.subnet_id
  security_groups = var.security_groups
}