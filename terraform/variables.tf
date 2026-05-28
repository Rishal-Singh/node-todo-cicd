variable "aws_region" {
  default = "us-east-1"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "AWS EC2 Key Pair Name"
  default = "terraform"
}

variable "ami_id" {
  default = "ami-091138d0f0d41ff90"
}
