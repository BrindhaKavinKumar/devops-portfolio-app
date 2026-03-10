output "ec2_public_ip" {
  value = aws_instance.portfolioapp.public_ip
}

output "ec2_public_dns" {
  value = aws_instance.portfolioapp.public_dns
}

output "instance_id" {
  value = aws_instance.portfolioapp.id
}

output "ssh_command" {
  value = "ssh ubuntu@${aws_instance.portfolioapp.public_ip}"
}

