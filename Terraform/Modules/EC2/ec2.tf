
resource "aws_instance" "vm" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key
    subnet_id = var.subnet_id
    vpc_security_group_ids = [var.security_group_id]
    
    tags = {
        Name = "Test-Server"
    }
}
