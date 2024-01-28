resource "aws_key_pair" "tsrkey" {
  key_name   = "tsrKey"
  public_key = var.public_key
}

resource "aws_instance" "meta_dev_instance" {
    count = var.create_instance ? 1 : 0
    instance_type = var.instance_type
    ami = var.ami
    associate_public_ip_address = false
    availability_zone = "us-east-1a"
    key_name = aws_key_pair.tsrkey.key_name
    tags = {
        Name= "TsrWeb"
    }
}

resource "aws_instance" "meta_prod_instance" {
    count = var.environment == "prod" ? 1 : 0
    instance_type = var.instance_type
    ami = var.ami
    associate_public_ip_address = false
    availability_zone = "us-east-1a"
    key_name = aws_key_pair.tsrkey.key_name
    tags = {
        Name= "TsrWeb"
    }
}



resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "Main"
  }
}


resource "aws_vpc" "main" {
  cidr_block = var.environment == "dev" ? local.environments["dev"] : local.environments["prod"]
}


# if environment == "dev":
#     cidr_block = ododood
# else:
#     cidr_block ==  92epoKNUD

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main"
    owner =  local.owner
  }
}

resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }

  tags = {
    Name = "example"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.foo.id
  route_table_id = aws_route_table.bar.id
}


