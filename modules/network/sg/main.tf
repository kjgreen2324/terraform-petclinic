#-----------------------------ASG---------------------------------
resource "aws_security_group" "sg_web" {
  name        = "allow_web"
  description = "Allow web inbound traffic and web outbound traffic"
  vpc_id      = var.vpc_id
  #depends_on  = [aws_security_group.alb-sg]
  ingress {
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.sg_alb.id]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "web-sg"
  }
}

resource "aws_security_group" "sg_was" {
  name        = "allow_was"
  description = "Allow was inbound traffic and was outbound traffic"
  vpc_id      = var.vpc_id
  #depends_on  = [aws_security_group.alb-sg]
  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    #cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.sg_alb.id]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "web-sg"
  }
}



#-----------------------------LB---------------------------------

resource "aws_security_group" "sg_alb" {
  name        = "alb-sg"
  description = "Allow web inbound traffic and all outbound traffic"
  #vpc_id      = aws_vpc.main.id
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "allow_http_instance"
  }

}

resource "aws_security_group" "sg_nlb" {
  name        = "sg_nlb"
  description = "Allow web inbound traffic and all outbound traffic"
  #vpc_id      = aws_vpc.main.id
  vpc_id      = var.vpc_id
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    security_groups = [aws_security_group.sg_web.id]

  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  lifecycle {
    create_before_destroy = true
  }
  tags = {
    Name = "allow_http_instance"
  }

}

#----------------------------DB---------------------------------

resource "aws_security_group" "sg_db" {
  name        = "allow_db"
  description = "Allow db inbound traffic and all outbound traffic"
  vpc_id      = var.vpc_id
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [aws_security_group.sg_was.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "allow_db"
  }
}

