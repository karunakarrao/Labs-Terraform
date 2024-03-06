# Creating a EC2 instance, and install docker. 

variable "docker_ami" {
  type = map(string)
  default = {
    ami           = "ami-0f403e3180720dd7e"
    instance_type = "t2.micro"
  }
}

resource "aws_instance" "docker" {
  ami           = var.docker_ami["ami"]
  instance_type = var.docker_ami["instance_type"]
  tags          = { Name = "Docker_Host" }

  key_name = aws_key_pair.docker_key.key_name

  user_data = <<-EOF
    #!/bin/bash
    sudo apt update -y
    sudo apt install -y docker
    sudo systemctl start docker
    sudo systemctl enable docker
  EOF
}
resource "aws_key_pair" "docker_key" {
  key_name = "local"
  public_key = file("C:\\Users\\karun\\.ssh\\id_rsa.pub")
}

