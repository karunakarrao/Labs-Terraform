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
  tags = { Name = "Docker_Host" }
}
