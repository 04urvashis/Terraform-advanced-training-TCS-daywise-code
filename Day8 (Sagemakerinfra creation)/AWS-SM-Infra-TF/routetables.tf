
resource "aws_eip" "sagenaker-eip" {
  instance = aws_instance.web.id
  vpc      = true
}

resource "aws_internet_gateway" "sagemaker-gw" {
  vpc_id = aws_vpc.sagemaker-vpc-urvashi

  tags = {
    Name = "sagemaker-gw"
  }
}

resource "aws_nat_gateway" "sagemaker-nat" {
  allocation_id = aws_eip.sagenaker-eip
  subnet_id = aws_subnet.zonea-private-subnet
    tags = {
    Name = "sagemaker-nat"
  }
}
resource "aws_nat_gateway" "sagemaker-nat" {
  allocation_id = aws_eip.sagenaker-eip
  subnet_id = aws_subnet.zoneb-private-subnet
  tags = {
    Name = "sagemaker-nat"
  }
}

resource "aws_route_table" "public-rt" {
  vpc_id = aws_vpc.sagemaker-vpc-urvashi

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.sagemaker-gw.id
  }

   #route {
   # ipv6_cidr_block        = "::/0"
    #egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  #}

  tags = {
    Name = "public-rt"
  }
}

resource "aws_route_table" "private-rt" {
  vpc_id = aws_vpc.sagemaker-vpc-urvashi

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.example.id
  }

 # route {
   # ipv6_cidr_block        = "::/0"
   # egress_only_gateway_id = aws_egress_only_internet_gateway.example.id
  #}

  tags = {
    Name = "private-rt"
  }
}

# aws-routetable-association with subnets

resource "aws_route_table_association" "zonea-public-subnet-association" {
    subnet_id = aws_subnet.zonea-public-subnet.id
    route_table_id = aws_route_table.public-rt
}
resource "aws_route_table_association" "zonea-private-subnet-association" {
    subnet_id = aws_subnet.zonea-private-subnet.id
    route_table_id = aws_route_table.private-rt
}

resource "aws_route_table_association" "zoneb-public-subnet-association" {
    subnet_id = aws_subnet.zoneb-public-subnet.id
    route_table_id = aws_route_table.public-rt
}
resource "aws_route_table_association" "zoneb-private-subnet-association" {
    subnet_id = aws_subnet.zoneb-private-subnet.id
    route_table_id = aws_route_table.private-rt
}

# NAT - resolution still pending