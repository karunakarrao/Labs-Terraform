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
    sudo yum update -y
    sudo yum install -y docker
    sleep 10
    sudo systemctl start docker
    sudo systemctl enable docker
  EOF

  provisioner "remote-exec" {
    inline = [
      "docker --version"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"            # Change to your SSH user
      private_key = file("C:\\Users\\karun\\.ssh\\id_rsa") # Change to the path of your private key
      host        = self.public_ip
    }
  }

}
resource "aws_key_pair" "docker_key" {
  key_name   = "local"
  public_key = file("C:\\Users\\karun\\.ssh\\id_rsa.pub")
}

output "docker_host_info" {
  value = aws_instance.docker.public_dns
}