#!/bin/bash
sudo yum update
sudo yum install -y httpd
sudo systemctl enable httpd
sudo systemctl start httpd
echo "httpd" > /var/www/html/index.html
