# ec2.tf
````

resource "aws_instance" "vm" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key
    vpc_security_group_ids = ["sg-0573b38f4d0928041"]
    user_data = <<-EOF
    #!/bin/bash
    sudo -i
    yum update -y
    yum install httpd -y
    systemctl start httpd 
    systemctl enable httpd 
    echo "Hello World" > /var/www/html/index.html
    EOF
    tags = {
        Name = "Web-Server"
    }
}
````

# variable.tf
````
variable "ami_id" {
    type = string
    description = "ami id of region ap-southeast-1"
    default =  "ami-0065ec299f6f08df7"
}

variable "instance_type" {
    type = string 
    default = "t2.micro"
  
}

variable "key" {
  type = string
  default = "laptop-key"
}
````

# output.tf
````
output "ami" {
    value = aws_instance.vm.ami
  
}

output "public_ip" {
    value = aws_instance.vm.public_ip
  
}
````

