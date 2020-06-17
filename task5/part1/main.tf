terraform {
  backend "s3" {
    bucket = "cand-terraform"
    key    = "proj2/ex1/terraform.tfstate"
    region = "us-east-1"
  }
}


# TODO: Designate a cloud provider, region, and credentials
provider "aws" {
  profile = "personal"
  region  = "us-east-1"
}

data "aws_ami" "latest_amazon_linux" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-*"]
  }

}

# TODO: provision 4 AWS t2.micro EC2 instances named Udacity T2
resource "aws_instance" "udacity_t2" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = "t2.micro"
  count         = 4
  tags = {
    Name = "Udacity T2"
  }
}

//# TODO: provision 2 m4.large EC2 instances named Udacity M4
//resource "aws_instance" "udacity_m4" {
//  ami           = data.aws_ami.latest_amazon_linux.id
//  instance_type = "m4.large"
//  count         = 2
//  tags = {
//    Name = "Udacity M4"
//  }
//}