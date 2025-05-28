#!/bin/bash
# Validate Terraform configuration and generate a plan
echo "Validating Terraform configuration..."
terraform validate && terraform plan -out=tfplan
