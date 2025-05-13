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
