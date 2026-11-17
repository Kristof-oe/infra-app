vpc = {
  name       = "aws_vpc"
  cidr_block = "10.0.0.0/16"
  tags       = {}
  NAT_subnet = "kris_public_1"
  subnets = [{
    name       = "kris_public_1"
    cidr_block = "10.0.0.0/24"
    type       = "public"
    },
    {
      name       = "kris_public_2"
      cidr_block = "10.0.1.0/24"
      type       = "public"
    },
    {
      name       = "kris_public_3"
      cidr_block = "10.0.2.0/24"
      type       = "public"
    },
    {
      name       = "kris_priv_1"
      cidr_block = "10.0.3.0/24"
      type       = "private"
    },
    {
      name       = "kris_priv_2"
      cidr_block = "10.0.4.0/24"
      type       = "private"
    },
    {
      name       = "kris_priv_3"
      cidr_block = "10.0.5.0/24"
      type       = "private"
  }]
}

eks_cluster = {
  subnets = ["kris_public_1", "kris_public_2", "kris_public_3", "kris_priv_1", "kris_priv_2", "kris_priv_3"]
  name    = "eks_task"
  version = "1.37"
}

node_group = [{
  name    = "kris_node",
  subnets = ["kris_priv_1", "kris_priv_2", "kris_priv_3"]
}]
ecr = [{
  name                 = "sa"
  image_tag_mutability = "IMMUTABLE_WITH_EXCLUSION"
  filter               = "s*"
  filter_type          = "WILDCARD"

  },
  {
    name                 = "sb"
    image_tag_mutability = "IMMUTABLE_WITH_EXCLUSION"
    filter               = "s*"
    filter_type          = "WILDCARD"
  }
]


