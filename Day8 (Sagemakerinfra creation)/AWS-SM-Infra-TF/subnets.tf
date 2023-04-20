#us-east-2
# us-east-2a public subnet,private subnet

resource "aws_subnet" "zonea-public-subnet" {
  #vpc_id     = aws_vpc.main.id
  vpc_id = aws_vpc.sagemaker-vpc-urvashi
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "zonea-public-subnet"
  }
}
resource "aws_subnet" "zonea-private-subnet" {
  #vpc_id     = aws_vpc.main.id
  vpc_id = aws_vpc.sagemaker-vpc-urvashi
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "zonea-private-subnet"
  }
}

resource "aws_subnet" "zoneb-public-subnet" {
  #vpc_id     = aws_vpc.main.id
  vpc_id = aws_vpc.sagemaker-vpc-urvashi
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "zoneb-public-subnet"
  }
}
resource "aws_subnet" "zoneb-private-subnet" {
  #vpc_id     = aws_vpc.main.id
  vpc_id = aws_vpc.sagemaker-vpc-urvashi
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-2a"

  tags = {
    Name = "zoneb-private-subnet"
  }
}