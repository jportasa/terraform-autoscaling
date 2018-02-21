#!/bin/bash
EC2_ID=$(curl -s http://169.254.169.254/latest/meta-data/instance-id)
EC2_NAME=$(echo $EC2_ID | cut -d'-' -f 2)
EC2_AVAIL_ZONE=`curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone`
EC2_REGION="`echo \"$EC2_AVAIL_ZONE\" | sed -e 's:\([0-9][0-9]*\)[a-z]*\$:\\1:'`"

apt-get update
apt-get install -y nginx

