//creating a vpc

resource "aws_vpc" "myvpc" {
  cidr_block = var.myvpc
}

//creating a Private Subnet

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.private_subnet
  availability_zone = "us-east-1a"  
}

//creating a Public Subnet

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.myvpc.id
  cidr_block = var.public_subnet
  availability_zone = "us-east-1a"
}

//creating internet gateway

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.myvpc.id
}

//creating route tables

resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.myvpc.id
  route {
    cidr_block = var.public_route
    gateway_id = aws_internet_gateway.ig.id
  }
}
//route association

resource "aws_route_table_association" "public_route" {
  subnet_id = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_route.id
  
}

resource "aws_security_group" "web_sg" {
   name   = "HTTP and SSH"
   vpc_id = aws_vpc.myvpc.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
} 
