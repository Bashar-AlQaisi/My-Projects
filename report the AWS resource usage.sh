#!/bin/bash

###############################################
# Author: Bashar
#
# Date: 11th-Jan
#
# Version: vl
#
# This script will report the AWS resource usage
###############################################

# AWS s3
# AWS EC2 
# AWS Lambda
# AWS IAM Users

# Function to handle errors
handle_error() {
    echo "Error: $1"
    exit 1
}

# list s3 bucket
echo "List of S3 buckets:"
aws s3 ls || handle_error "Failed to list S3 buckets"

# list EC2 instances
echo "List of EC2 instances:"
aws ec2 describe-instances --query "Reservations[*].Instances[*].[InstanceId, InstanceType, State.Name, PublicIpAddress, PrivateIpAddress]" --output table || handle_error "Failed to list EC2 instances"

# list lambda functions
echo "List of Lambda functions:"
aws lambda list-functions --query "Functions[*].[FunctionName, Runtime, Handler, Role]" --output table || handle_error "Failed to list Lambda functions"

# list IAM users
echo "List of IAM users:"
aws iam list-users --query "Users[*].[UserName, UserId, CreateDate]" --output table || handle_error "Failed to list IAM users"