# ===================================
# AWS 服务说明
# 使用区域: ap-northeast-2
# EC2类型: t2.micro
# aws秘钥: 
# ===================================

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~>5.0"
    }
  }
}

# provider: 服务商
provider "aws" {
  region = "ap-northeast-2"
}

# ami: 镜像名称
resource "aws_instance" "example" {
  ami           = "ami-02c956980e9e063e5"
  instance_type = "t2.micro"
  # 添加实例名称
  tags = {
    Name = "terraform-example-01"
  }
}