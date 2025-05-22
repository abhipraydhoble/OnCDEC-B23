
resource "aws_vpc" "vnet" {
    cidr_block = var.vpc_cidr_block
    tags = {
        Name = "VPC-B23"
    }
  
}
resource "aws_subnet" "pub" {
    vpc_id = aws_vpc.vnet.id
    cidr_block = var.subnet_cidr_block
    availability_zone = var.az
    map_public_ip_on_launch = var.public_ip
    tags = {
        Name = "Public-Subnet"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.vnet.id 
    tags = {
        Name = "igw-b23"
    }
}

resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.vnet.id
    tags = {
        Name = "RT-Public"
    }

    route {
        gateway_id = aws_internet_gateway.gw.id
        cidr_block = "0.0.0.0/0"
    }
}

resource "aws_route_table_association" "rta" {
    route_table_id = aws_route_table.rt.id 
    subnet_id = aws_subnet.pub.id
}

resource "aws_security_group" "new" {
  name = "cdec-b49-sg"
  vpc_id = aws_vpc.vnet.id 
  ingress {
    from_port = 80
    to_port = 80 
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }
   ingress {
    from_port = 22
    to_port = 22
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0 
    to_port = 0 
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
