#!/bin/bash
#######################
# Author: Pratik Shastrakar
# Date: 24-05-2023
#
# Version: V1
#
# This script will report the AWS resource usage
#######################

# AWS S3
# AWS EC2
# AWS Lambda
# AWS IAM Users
set -x
# list aws s3 buckets
echo "Print list of s3 buckets"
aws s3 ls

# list ec2 instances
echo "Print list of ec2 instances"
aws ec2 describe-instances > resourceTracker

# list lambda
echo "Print list of lambda functions"
aws lambda list-functions

# list IAM users
echo "Print list of iam users"
aws iam list-users

--
:wq

chmod 777 aws_resource_tracker.sh
./aws_resource_tracker.sh 

./aws_resource_tracker.sh | more

aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId'