
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  # Other VPC configuration options

  tags = {
    Name = "gms-east-1-qa-vpc"  
  }
}


# create the private subnet for the  availability zone 

resource "aws_subnet" "private-subnet-1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnet_1a  # Pass the cidr_block
  availability_zone       = "us-west-2a"     # Example availability zone 
  map_public_ip_on_launch = false            # map_public_ip_on_launch is set to false, instances launched in this subnet will not be assigned a public IP address by default. This is commonly used for private subnets where you don't want instances to have direct internet access.

  tags = {
    Name ="gms-east-1-qa-subnet-private1-us-west-2a"
  }
}


# create the private subnet for the us-east-1b availability zone 

resource "aws_subnet" "private-subnet-1b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.private_subnet_1b  # Pass the cidr_block 
  availability_zone       = "us-west-2b"     # Example availability zone 
  map_public_ip_on_launch = false            # map_public_ip_on_launch is set to false, instances launched in this subnet will not be assigned a public IP address by default. This is commonly used for private subnets where you don't want instances to have direct internet access.

  tags = {
    Name ="gms-east-1-qa-subnet-private1-us-west-2b"
  }
}



# Attaching the public subnet into each availability zone

# Create a public subnet in us-east-1a

resource "aws_subnet" "public-subnet-1a" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_1a # Define the CIDR block for the public subnet in us-west-2a
  availability_zone       = "us-west-2a"
  map_public_ip_on_launch = false # This allows instances launched in this subnet to receive public IP addresses.

  tags = {
    Name = "gms-east-1-qa--subnet-public1-us-west-2a"
  }
}



resource "aws_subnet" "public-subnet-1b" {
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = var.public_subnet_1b # Define the CIDR block for the public subnet in us-west-2b
  availability_zone       = "us-west-2b"
  map_public_ip_on_launch = false # This allows instances launched in this subnet to receive public IP addresses.

  tags = {
    Name = "gms-east-1-qa-subnet-public2-us-west-2b"
  }
}
