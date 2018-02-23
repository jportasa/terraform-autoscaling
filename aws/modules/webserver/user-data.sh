#!/bin/bash

EC2_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
EC2_NAME=$(echo $EC2_ID | cut -d'-' -f 2)
EC2_AVAIL_ZONE=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone`
EC2_REGION="`echo \"$EC2_AVAIL_ZONE\" | sed -e 's:\([0-9][0-9]*\)[a-z]*\$:\\1:'`"
sudo hostnamectl set-hostname --static ${hostname}-$EC2_NAME



#For ubuntu16
sudo apt-get update
sudo apt-get -y install ruby
sudo apt-get -y install wget
cd /home/ubuntu
wget https://aws-codedeploy-eu-west-1.s3.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
sudo service codedeploy-agent status
sudo service codedeploy-agent start
