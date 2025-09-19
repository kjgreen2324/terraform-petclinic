/*
  output "aws_key_name" {
  value = aws_key_pair.mykey.key_name
}
output "web_sg_id" {
  value = aws_security_group.web-sg_id.id
}
  output "launch_latest_ver" {
  value = aws_launch_template.tf-launch.latest_version
}
  output "asg_name" {
  value = aws_autoscaling_group.tf-web-asg.name
}
*/


output "public_key" {
  value = file("${path.module}/keys/mykey.pub")
}

output "ami_id" {
  value = data.aws_ami.ami.id
}
