#!/bin/bash
sudo yum update -y
sudo yum install -y docker
sleep 10
sudo systemctl start docker
sudo systemctl enable docker
echo $(docker -v)