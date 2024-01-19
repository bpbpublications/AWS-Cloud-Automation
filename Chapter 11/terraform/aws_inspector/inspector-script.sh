#!/bin/bash
# Install the AWS Agent for Amazon Inspector
echo Installing the AWS agent for Amazon Inspector
sudo wget https://d1wk0tztpsntt1.cloudfront.net/linux/latest/install &&
wait 45
sudo bash install &&
sudo /opt/aws/awsagent/bin/awsagent start &&
sudo /opt/aws/awsagent/bin/awsagent enable
