````
resource "aws_instance" "vm" {
    ami = "ami-0e8ebb0ab254bb563" # change ami id
    instance_type = "t2.micro"
    key_name = "laptop-key"       # change key pair name


    tags = {
        Name = "TF-Server"
    }
}
````

````
terraform validate
````

````
terraform plan
````

````
terraform apply 
````
````
terraform destroy
````



````
variable "instance_names" {
  default = ["web", "app", "db"]
}

resource "aws_instance" "example" {
  for_each = toset(var.instance_names)

  ami           = "ami-123456"
  instance_type = "t2.micro"
  tags = {
    Name = each.value
  }
}

````
````
resource "aws_instance" "example" {
  count         = 3
  ami           = "ami-123456" # Use a valid AMI
  instance_type = "t2.micro"

  tags = {
    Name = "server-${count.index}"
  }
}
````

````




