provider "aws" {
profile = "venu"
  
}
 resource "aws_instance" "Linux" {
  ami = "ami-05a5f6298acdb05b6"
  subnet_id = aws_subnet.subnet-1.id
   instance_type     = "t2.micro"
#   #instance_platform = "Linux"ss
#   #availability_zone = "eu-east-1"
 tags = {
 Name = "linux-server"}
 }

 resource "aws_vpc" "my-first-vpc" {
  cidr_block = "10.0.0.0/16"

 tags = {
    name = "vpc-creation"}
}

resource "aws_subnet" "subnet-1" {
vpc_id = aws_vpc.my-first-vpc.id
cidr_block = "10.0.1.0/24"

tags = {
  name = "prod-subnet"

}
}

resource "aws_s3_bucket" "tests3" {
 bucket = "my-test-buicket"
 tags = {
   name = "myfirsts3"
   
 }
}