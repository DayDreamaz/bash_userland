variable "public_key" {}


variable "ami" {
    default = "ami-06aa3f7caf3a30282"
    type = string
}


variable "instance_type" {
    default = "t2.micro"
}

variable "create_instance"{
    type = bool
}

variable "environment" {
    type = string
}