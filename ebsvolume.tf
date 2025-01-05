resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 2

  tags = {
    Name = "HelloWorld1"
  }
}
resource "aws_instance" "ex" {
  availability_zone = "us-east-1a"
  ami = "ami-0583d8c7a9c35822c"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld1"
  }
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdc"
  instance_id = aws_instance.ex.id
  volume_id = aws_ebs_volume.example.id
}
