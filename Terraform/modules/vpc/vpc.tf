data "aws_availability_zones" "available" {
  state = "available"
} 


locals {

  public_subnet = {
    for subnet in toset(var.vpc.public_subnets) : 
    subnet => data.aws_availability_zones.available.names[index(var.vpc.public_subnets, subnet) % length(data.aws_availability_zones.available.names)]
  
  }

  private_subnet = {
    for subnet in toset(var.vpc.private_subnets) : 
    subnet => data.aws_availability_zones.available.names[index(var.vpc.private_subnets, subnet) % length(data.aws_availability_zones.available.names)]
  
  }

}

resource "aws_vpc" "moeez_vpc" {
  cidr_block       = var.vpc.cidr

  tags = {
    Name = "moeez_vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  count          = length(var.vpc.public_subnets)
  vpc_id            = aws_vpc.moeez_vpc.id
  cidr_block        = var.vpc.public_subnets[count.index]
  availability_zone = local.public_subnet[var.vpc.public_subnets[count.index]]               
  map_public_ip_on_launch = "true"
  
  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  count          = length(var.vpc.private_subnets)
  vpc_id            = aws_vpc.moeez_vpc.id
  cidr_block        = var.vpc.private_subnets[count.index]
  availability_zone = local.private_subnet[var.vpc.private_subnets[count.index]]     

  tags = {
    Name = "private_subnet"
  }
}


resource "aws_internet_gateway" "moeez_igw" {
  vpc_id = aws_vpc.moeez_vpc.id

  tags = {
    Name = "moeez_igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.moeez_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.moeez_igw.id
  }

  tags = {
    Name = "public_rt"
  }
}
resource "aws_eip" "eip" {
  vpc = true
}

resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.eip.id
  subnet_id     =  aws_subnet.public_subnet[1].id
  depends_on    = [aws_internet_gateway.moeez_igw]
}

resource "aws_route_table" "private_rt" {
 vpc_id = aws_vpc.moeez_vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gw.id
  }

  tags = {
    Name = "private_rt"
  }
}

resource "aws_route_table_association" "public_rt" {
  count          = length(var.vpc.public_subnets)
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_route_table_association" "private_rt" {
  count =  length(var.vpc.private_subnets)
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private_rt.id
}
