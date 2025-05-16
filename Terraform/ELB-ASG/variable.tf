variable "ami_id" {
    type = string
    description = "ami id of region ap-southeast-1"
    default = "ami-0065ec299f6f08df7"
    
}

variable "instance_type" {
    type = string 
    default = "t2.micro"  
}

variable "key" {
  type = string
  default = "laptop-key"
 
}
