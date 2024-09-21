resource "aws_instance" "expense" {
  for_each = var.instances # this variable is map
  # for_each will give us a special variable with name each 
  ami                    = "ami-09c813fb71547fc4f" # AMI id will chnage over the time
  instance_type          = each.value              # in this example mysql = "t3.small" here mysql is key and t3.small is  value so instance_type is value means t3.small and 
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]
  tags = merge(
    var.common_tags,
    var.tags,
    {
      Name = each.key
    }
  )

}

resource "aws_security_group" "allow_ssh_terraform" {
  name        = "allow_sshh_${var.environment}" # allow_ssh is already there in my account
  description = "Allow Port no 22 for ssh access"

  #usually will allow everything in egress what protol or ip address(we are not checking)
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] #allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }
    tags = merge(
        var.common_tags,
        var.tags,
        {
            Name = "allow_sshh_${var.environment}"
        }
    )
}