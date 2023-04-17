# setup the overall dependencies
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 4.0"
        }
    }   
}

# setup a provider (e.g. AWS, GCP, Azure, etc.)
provider "aws" {
    region = "us-east-1"
    shared_credentials_files = ["./credentials"]
}

# setup a resource (e.g. EC2, S3, etc.)
resource "aws_instance" "hextris-server" {
    ami = "ami-005f9685cb30f234b"
    instance_type = "t2.micro"
    key_name = "vockey"
    tags = {
        Name = "hextris"
    }
}