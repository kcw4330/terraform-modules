// VPC 생성성
resource "aws_vpc" "tf_vpc" {
  cidr_block = var.vpc_cidr

  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.pjt_name}_vpc"
  }
}

// 인터넷 게이트웨이 생성
resource "aws_internet_gateway" "tf_igw" {
  vpc_id = aws_vpc.tf_vpc.id

  tags = {
    Name = "${var.pjt_name}_igw"
  }
}

resource "aws_subnet" "this" {
  for_each = { for sn in var.subnets : sn.name => sn }

  vpc_id            = aws_vpc.tf_vpc.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.az

  tags = {
    Name = each.value.name
  }
}
