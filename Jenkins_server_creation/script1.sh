#!/bin/bash
set -e

echo "=============================="
echo "Updating system"
echo "=============================="
sudo apt update -y
sudo apt upgrade -y

echo "=============================="
echo "Installing Latest Java (OpenJDK 21)"
echo "=============================="
sudo apt install -y openjdk-21-jdk

java -version

echo "=============================="
echo "Installing Git"
echo "=============================="
sudo apt install -y git
git --version

echo "=============================="
echo "Installing Jenkins (Latest LTS)"
echo "=============================="
curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee \
  /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update -y
sudo apt install -y jenkins

sudo systemctl enable jenkins
sudo systemctl start jenkins
sudo systemctl status jenkins --no-pager

echo "=============================="
echo "Installing Terraform (Latest)"
echo "=============================="
sudo apt install -y gnupg software-properties-common curl

curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor \
  -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee \
/etc/apt/sources.list.d/hashicorp.list

sudo apt update -y
sudo apt install -y terraform

terraform version

echo "=============================="
echo "Jenkins Initial Admin Password"
echo "=============================="
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

echo "=============================="
echo "Installation Completed"
echo "Jenkins URL: http://<server-ip>:8080"
echo "=============================="
