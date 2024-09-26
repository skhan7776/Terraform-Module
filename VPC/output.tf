//output "vpcs" {
  //description = "VPC Outputs"
  //value       = { for vpc in aws_vpc.this : vpc.tags.Name => { "cidr_block" : vpc.cidr_block, "id" : vpc.id } }
//}

output "vpc_id" {
  value = aws_vpc.myvpc.id
}

output "subnet_id" {
  value = aws_subnet.public_subnet.id
}

output "security_groups" {
  value = aws_vpc.myvpc.id
  
}