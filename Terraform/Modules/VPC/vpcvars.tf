
variable "vpc_cidr_block" {
    type = string
  
}

variable "subnet_cidr_block" {
  type = string
}

variable "az" {
  type = string 
}

variable "public_ip" {
  type = bool
}
