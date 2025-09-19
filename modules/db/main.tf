resource "aws_db_instance" "tf-db" {
  allocated_storage      = 10
  db_name                = "petclinic"
  engine                 = "mysql"
  engine_version         = "8.0"
  instance_class         = "db.t3.micro"
  username               = "root"
  password               = "12345678"
  parameter_group_name   = "default.mysql8.0"
  multi_az               = false
  skip_final_snapshot    = true
  db_subnet_group_name   = var.db_sub_id
  vpc_security_group_ids = [var.sg_db_id]
}

