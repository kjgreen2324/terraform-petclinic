resource "aws_eip" "pub_a" {
  domain = "vpc"
  tags = {
    Name = "tf-eip-ap-northeast-2a"
  }
}
resource "aws_nat_gateway" "tf-nat" {
  allocation_id = aws_eip.pub_a.id
  subnet_id     = var.pub_a_sub_id

  tags = {
    Name = "tf-nat-public1-ap-northeast-2a"
  }

  depends_on = [var.vpc_id]
}