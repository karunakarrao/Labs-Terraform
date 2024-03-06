provider "aws" {
  region = "us-east-1"  # Change to your desired AWS region
}

resource "aws_instance" "example" {
  ami           = "ami-0f403e3180720dd7e"  # Amazon Linux 2 AMI ID
  instance_type = "t2.micro"
  key_name      = aws_key_pair.local.key_name  # Change to your key pair name
  tags = {
    Name = "example-instance"
  }

  user_data = <<-EOF
              #!/bin/bash
              echo "Executing user_data script"
              # Add your user_data script commands here
              # For example, update packages
              sudo yum update -y
              # Print success message
              echo "User_data execution successful"
              EOF
}
resource "aws_key_pair" "local" {
  key_name = "local"
  public_key = file("C:\\Users\\karun\\.ssh\\id_rsa.pub")
}


output "user_data_success" {
  value = aws_instance.example.public_ip
}
