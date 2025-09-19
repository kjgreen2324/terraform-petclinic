#--------------------------ROUTE-------------------------------

resource "aws_route_table" "pub" {
  vpc_id = var.vpc_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = var.igw_id
  }
  tags = {
    Name = "tf-rtb-public"
  }
}
resource "aws_route_table_association" "pub_a" {
  subnet_id      = var.pub_a_sub_id
  route_table_id = aws_route_table.pub.id
}
resource "aws_route_table_association" "pub_c" {
  subnet_id      = var.pub_c_sub_id
  route_table_id = aws_route_table.pub.id
}
resource "aws_route_table" "pri" {
  vpc_id = var.vpc_id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_id
  }
  tags = {
    Name = "tf-rtb-private01-c-ap-northeast-a"
  }
}
/*
resource "aws_route_table" "pri01_c_route" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_id
  }
  tags = {
    Name = "tf-rtb-private01-c-ap-northeast-c"
  }
}

resource "aws_route_table" "pri02_a_route" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_id
  }
  tags = {
    Name = "tf-rtb-private02-a-ap-northeast-a"
  }
}

resource "aws_route_table" "pri02_c_route" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_id
  }
  tags = {
    Name = "tf-rtb-private02-c-ap-northeast-c"
  }
}

resource "aws_route_table" "pri03_a_route" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_id
  }
  tags = {
    Name = "tf-rtb-private03-a-ap-northeast-a"
  }
}

resource "aws_route_table" "pri03_c_route" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = var.nat_id
  }
  tags = {
    Name = "tf-rtb-private03-c-ap-northeast-c"
  }
}
*/

resource "aws_route_table_association" "pri01_a_route" {
  subnet_id      = var.pri01_a_sub_id
  route_table_id = aws_route_table.pri.id
}

resource "aws_route_table_association" "pri01_c_route" {
  subnet_id      = var.pri01_c_sub_id
  route_table_id = aws_route_table.pri.id
}

resource "aws_route_table_association" "pri02_a_route" {
  subnet_id      = var.pri02_a_sub_id
  route_table_id = aws_route_table.pri.id
}

resource "aws_route_table_association" "pri02_c_route" {
  subnet_id      = var.pri02_c_sub_id
  route_table_id = aws_route_table.pri.id
}

resource "aws_route_table_association" "pri03_a_route" {
  subnet_id      = var.pri03_a_sub_id
  route_table_id = aws_route_table.pri.id
}

resource "aws_route_table_association" "pri03_c_route" {
  subnet_id      = var.pri03_c_sub_id
  route_table_id = aws_route_table.pri.id
}
