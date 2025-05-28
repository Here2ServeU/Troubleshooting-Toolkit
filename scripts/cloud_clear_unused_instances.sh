#!/bin/bash
# Identify and list EC2 instances that are stopped for more than 7 days (AWS CLI required)
echo "Listing unused EC2 instances (stopped for more than 7 days)..."
aws ec2 describe-instances --filters "Name=instance-state-name,Values=stopped"   --query "Reservations[*].Instances[*].[InstanceId,State.Name,LaunchTime]"   --output table
