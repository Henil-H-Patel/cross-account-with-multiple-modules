provider "aws" {
    region = var.region_name
}

# ============= for the vpc ====================

module "vpc-east-1" {
    source = "./modules/vpc-east-1"
    vpc_cidr = var.vpc_cidr
    private_subnet_1a = var.private_subnet_1a
    private_subnet_1b = var.private_subnet_1b
    public_subnet_1a = var.public_subnet_1a 
    public_subnet_1b = var.public_subnet_1b
  
}

module "vpc-east-2" {
    source = "./modules/vpc-east-2"
    vpc_cidr = var.vpc_cidr
    private_subnet_1a = var.private_subnet_1a
    private_subnet_1b = var.private_subnet_1b
    public_subnet_1a = var.public_subnet_1a 
    public_subnet_1b = var.public_subnet_1b
  
}