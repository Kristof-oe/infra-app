# output "all_subnet_ids" {
#   value = flatten([
#     [for k, v in local.private_subnets : aws_subnet.this[k].id],
#     [for k, v in local.public_subnets : aws_subnet.this[k].id],
#   ])
# }

output "all_subnet_list" {
  value = [for key, sn in aws_subnet.this : { name = key, val = sn }]
}

output "vpc" {
  value = aws_vpc.this.id
}

output "vpc_cidr" {
  value = aws_vpc.this.cidr_block
}

output "private_subnets" {
  value = flatten([
    [for k, v in local.private_subnets : aws_subnet.this[k].id],
  ])
}