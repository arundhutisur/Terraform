resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/16"
    enable_dns_support = true
    enable_dns_hostnames = true
    tags = {
        Name = "My VPC"
    }
}

resource "aws_subnet" "subnet-a" {
    vpc_id            = aws_vpc.main.id
    cidr_block        = "10.0.1.0/24"
    availability_zone = "us-east-1a" # Replace with your desired AZ
    tags = {
        Name = "Subnet-A"
    }
}

resource "aws_subnet" "subnet-b" {
    vpc_id            = aws_vpc.main.id
    cidr_block        = "10.0.2.0/24"
    availability_zone = "us-east-1b" # Replace with your desired AZ
    tags = {
        Name = "Subnet-B"
    }
}

# Create an internet gateway and add appropriate tags
resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "Internet Gateway"
    }
}

# Create a route table with a route to the internet gateway and tags
resource "aws_route_table" "public_route_table" {
    vpc_id = aws_vpc.main.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gw.id
    }
    tags = {
        Name = "Public Route Table"
    }
}

# Associate the public route table with the public subnet
resource "aws_route_table_association" "public_subnet_route_table_assoc1" {
    subnet_id         = aws_subnet.subnet-a.id
    route_table_id    = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public_subnet_route_table_assoc2" {
    subnet_id         = aws_subnet.subnet-b.id
    route_table_id    = aws_route_table.public_route_table.id
}


resource "aws_security_group" "ssh" {
    name = "SSH"
    vpc_id = aws_vpc.main.id

    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"] # Restrict this for production environments
        
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "SSH Security Group"
    }
}

resource "aws_db_subnet_group" "rds_group" {
  name       = "subnet group"
  subnet_ids = [aws_subnet.subnet-a.id, aws_subnet.subnet-b.id]

  tags = {
    Name = "RDS subnet group"
  }
}

resource "aws_db_instance" "RDS" {
  allocated_storage    = 10
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "admin123"
  db_subnet_group_name = aws_db_subnet_group.rds_group.name
  vpc_security_group_ids = [aws_security_group.ssh.id]
  publicly_accessible    = true
  skip_final_snapshot    = true
  multi_az = false
  tags = {
    Name = "RDS database"
  }
}
