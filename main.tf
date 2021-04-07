provider aws {
  region = "ap-south-1"
  profile = "default"
}
resource aws_instance "myec2" {
  ami        = data.aws_ami.latest-ubuntu.id
  instance_type = "t2.nano"
}
data "aws_ami" "latest-ubuntu" {
most_recent = true
owners = ["099720109477"] # Canonical

  filter {
      name   = "name"
      values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }

  filter {
      name   = "virtualization-type"
      values = ["hvm"]
  }
}
