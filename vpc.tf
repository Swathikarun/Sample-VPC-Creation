# VPC Creation
#================

resource "aws_vpc" "vpc" {

  cidr_block           = var.vpc_cidr
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "${var.project}-vpc"
    project = var.project
  }
}

# Attaching Internet Gateway
#==========================

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
 
  tags = {
    Name = "${var.project}-igw"
    project = var.project
  }

}

# Creating subnet public1
#==========================

resource "aws_subnet" "public1" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_public1_cidr
    availability_zone        = var.subnet_public1_az
  map_public_ip_on_launch   = true

 tags = {
    Name = "${var.project}-public1"
    project = var.project
  }
}


# Creating subnet public2
#==========================

resource "aws_subnet" "public2" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_public2_cidr
    availability_zone        = var.subnet_public2_az
  map_public_ip_on_launch   = true

 tags = {
    Name = "${var.project}-public2"
    project = var.project
  }
}

# Creating subnet public3
#==========================

resource "aws_subnet" "public3" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_public3_cidr
    availability_zone        = var.subnet_public3_az
  map_public_ip_on_launch   = true

 tags = {
    Name = "${var.project}-public3"
    project = var.project
  }
}



# Creating subnet private1
#==========================

resource "aws_subnet" "private1" {
  vpc_id                     = aws_vpc.vpc.id
  cidr_block                 = var.subnet_private1_cidr
  availability_zone          = var.subnet_private1_az
  map_public_ip_on_launch    = false

 tags = {
    Name    = "${var.project}-private1"
    project = var.project
  }
}


# Creating subnet private2
#==========================

resource "aws_subnet" "private2" {
  vpc_id                     = aws_vpc.vpc.id
  cidr_block                 = var.subnet_private2_cidr
  availability_zone          = var.subnet_private2_az
  map_public_ip_on_launch    = false

 tags = {
    Name    = "${var.project}-private2"
    project = var.project
  }
}


# Creating subnet private3
#==========================

resource "aws_subnet" "private3" {
  vpc_id                     = aws_vpc.vpc.id
  cidr_block                 = var.subnet_private3_cidr
  availability_zone          = var.subnet_private3_az
  map_public_ip_on_launch    = false

 tags = {
    Name    = "${var.project}-private3"
    project = var.project
  }
}

# Allocating Elastic IP
#=====================

resource "aws_eip" "eip" {
  vpc      = true
   tags = {
    Name    = "${var.project}-eip"
    project = var.project
  }
}

# Creating Nat Gateway
#======================

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public2.id

   tags = {
    Name    = "${var.project}-nat"
    project = var.project
  }

}

# Route Table creation Public
#=======================

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
   tags = {
    Name    = "${var.project}-route-public"
    project = var.project
  }
}


# Route Table creation Private
#===============================

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
   tags = {
    Name    = "${var.project}-route-private"
    project = var.project
  }
}

# Route Table Association subnet Public1 rtb public
#===================================================

resource "aws_route_table_association" "public1" {
  subnet_id      = aws_subnet.public1.id
  route_table_id = aws_route_table.public.id
}


# Route Table Association subnet Public2 rtb public
#===================================================

resource "aws_route_table_association" "public2" {
  subnet_id      = aws_subnet.public2.id
  route_table_id = aws_route_table.public.id
}

# Route Table Association subnet Public3 rtb public
#====================================================

resource "aws_route_table_association" "public3" {
  subnet_id      = aws_subnet.public3.id
  route_table_id = aws_route_table.public.id
}



# Route Table Association subnet Private1 rtb Private
#====================================================

resource "aws_route_table_association" "private1" {
  subnet_id      = aws_subnet.private1.id
  route_table_id = aws_route_table.private.id
}

# Route Table Association subnet Private2 rtb Private
#====================================================

resource "aws_route_table_association" "private2" {
  subnet_id      = aws_subnet.private2.id
  route_table_id = aws_route_table.private.id
}

# Route Table Association subnet Private3 rtb Private
#====================================================

resource "aws_route_table_association" "private3" {
  subnet_id      = aws_subnet.private3.id
  route_table_id = aws_route_table.private.id
}


