variable "region" {
  type    = string
  default = "eu-central-1"
}

variable "project_name" {
  type    = string
  default = "terra_app"
}
variable "vpc" {
  type = object({
    name       = string
    cidr_block = string
    tags       = map(string)
    NAT_subnet = string

    subnets = list(object({
      name       = string
      cidr_block = string
      type       = string

      availability_zone = optional(string)
    }))
  })
}

variable "eks_cluster" {
  type = object({
    subnets = list(string)
    name    = string
    version = string

    configure_kubectl = optional(bool)
  })
}



variable "node_group" {
  type = list(object({
    name = string
    subnets =list(string)
  }))
}


variable "ecr" {
  type = list(object({
    name                 = string
    image_tag_mutability = string
    filter               = string
    filter_type          = string
  }))
}