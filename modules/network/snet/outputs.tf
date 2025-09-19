  output "pub_a_sub_id" {
  value = aws_subnet.pub_a.id
}
  output "pub_c_sub_id" {
  value = aws_subnet.pub_c.id
}
  output "pri01_a_sub_id" {
  value = aws_subnet.pri01_a.id
}
  output "pri01_c_sub_id" {
  value = aws_subnet.pri01_c.id
}

  output "pri02_a_sub_id" {
  value = aws_subnet.pri02_a.id
}
  output "pri02_c_sub_id" {
  value = aws_subnet.pri02_c.id
}

  output "pri03_a_sub_id" {
  value = aws_subnet.pri03_a.id
}
  output "pri03_c_sub_id" {
  value = aws_subnet.pri03_c.id
}
  output "db_sub_id" {
  value = aws_db_subnet_group.tf-db.id
}
