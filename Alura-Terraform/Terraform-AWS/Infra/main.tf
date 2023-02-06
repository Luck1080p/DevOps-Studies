terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

#Provider us-east-1
provider "aws" {
  region = "us-east-1"
}

#Provider us-east-2
provider "aws" {
  alias = "us-east-2"
  region = "us-east-2"
}

#us-east-1, criação de 3 vms dev
resource "aws_instance" "dev" {
  count = 3
  ami = var.amis["us-east-1"]
  instance_type = "t2.micro"
  #key_name = "terraform-aws"

  tags = {
    Name = "dev${count.index}"
  }
  vpc_security_group_ids = [ "${aws_security_group.acesso-ssh.id}" ]
}

/*
#us-east-1 VM do bucket s3
resource "aws_instance" "dev4" {
  ami = var.amis["us-east-1"]
  instance_type = "t2.micro"
  key_name = "terraform-aws"

  tags = {
    Name = "dev4"
  }
  vpc_security_group_ids = [ "${aws_security_group.acesso-ssh.id}" ]
  depends_on = [aws_s3_bucket.dev4]
}
*/

#us-east-1 VM 
resource "aws_instance" "dev5" {
  ami = var.amis["us-east-1"]
  instance_type = "t2.micro"
  #key_name = "terraform-aws"

  tags = {
    Name = "dev5"
  }
  vpc_security_group_ids = [ "${aws_security_group.acesso-ssh.id}" ]
}

#us-east-2 VM6 do dynamoDB
resource "aws_instance" "dev6" {
  provider = aws.us-east-2
  ami = var.amis["us-east-2"]
  instance_type = "t2.micro"
  #key_name = "terraform-aws2"

  tags = {
    Name = "dev6"
  }
  vpc_security_group_ids = [ "${aws_security_group.acesso-ssh-us-east-2.id}" ]
  depends_on = [aws_dynamodb_table.dynamodb-homologacao]
}

#us-east-2 
resource "aws_instance" "dev7" {
  provider = aws.us-east-2
  ami = var.amis["us-east-2"]
  instance_type = "t2.micro"
  #key_name = "terraform-aws2"

  tags = {
    Name = "dev7"
  }
  vpc_security_group_ids = [ "${aws_security_group.acesso-ssh-us-east-2.id}" ]
}

/*
#us-east-1 bucket ligado a vm dev4
resource "aws_s3_bucket" "dev4" {
  bucket = "lbrs-dev4"

  tags = {
    Name        = "lbrs-dev4"
  }
}
#us-east-1 bucket ligado a vm dev4
resource "aws_s3_bucket_acl" "dev4" {
  bucket = aws_s3_bucket.dev4.id
  acl    = "private"
}
*/

#DB ligado a VM dev6
resource "aws_dynamodb_table" "dynamodb-homologacao" {
  provider = aws.us-east-2
  name           = "GameScores"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "UserId"
  range_key      = "GameTitle"

  attribute {
    name = "UserId"
    type = "S"
  }

  attribute {
    name = "GameTitle"
    type = "S"
  }
}