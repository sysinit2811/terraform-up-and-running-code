# ===================================
# AWS 服务说明
# 使用区域: ap-northeast-2
# EC2类型: t2.micro
# aws秘钥: 
# ===================================

provider "aws" {
  region = "ap-northeast-2"
}
resource "aws_instance" "example" {
  ami           = "ami-02c956980e9e063e5"
  instance_type = "t2.micro"

  # <<-EOF和 EOF是Terraform的heredoc语法，它可以让用户在无须插入换行符的情况下创建多行字符串。
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello, World" > index.html
              nohup busybox httpd -f -p 8080 &
              EOF

  tags = {
    Name = "terraform-example"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"
  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["106.120.8.130/32"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}