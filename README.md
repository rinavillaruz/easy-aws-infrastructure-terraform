# Easy AWS Infrastructure Deployment via Terraform

This repository contains Terraform configurations to deploy an **Easy AWS Infrastructure via Terraform**. It leverages Terraform modules for infrastructure automation.

## 🛠️ Features
- **VPC & Networking** – Configurable VPC, subnets, IGW
- **Security Groups** – Configurable Security groups for public and private subnets
- **EC2 Instances**
- **KEY Pairs**
- **Terraform Modules** – Modular and reusable code structure using Workspaces

## 📌 Prerequisites
- Terraform (`v1.12.2`)
- AWS CLI (`v2.22.10`)
- An AWS account with sufficient permissions

## Policy
```
{
	"Version": "2012-10-17",
	"Statement": [
		{
			"Effect": "Allow",
			"Action": [
				"ec2:DescribeVpcAttribute",
				"ec2:DescribeInstanceTypes",
				"ec2:DescribeAddressesAttribute",
				"ec2:CreateVpc",
				"ec2:DeleteVpc",
				"ec2:DescribeVpcs",
				"ec2:ModifyVpcAttribute",
				"ec2:CreateSubnet",
				"ec2:DeleteSubnet",
				"ec2:DescribeSubnets",
				"ec2:CreateInternetGateway",
				"ec2:DeleteInternetGateway",
				"ec2:DescribeInternetGateways",
				"ec2:AttachInternetGateway",
				"ec2:DetachInternetGateway",
				"ec2:CreateRouteTable",
				"ec2:DeleteRouteTable",
				"ec2:DescribeRouteTables",
				"ec2:AssociateRouteTable",
				"ec2:DisassociateRouteTable",
				"ec2:CreateRoute",
				"ec2:DeleteRoute",
				"ec2:CreateSecurityGroup",
				"ec2:DeleteSecurityGroup",
				"ec2:DescribeSecurityGroups",
				"ec2:DescribeSecurityGroupRules",
				"ec2:AuthorizeSecurityGroupIngress",
				"ec2:AuthorizeSecurityGroupEgress",
				"ec2:RevokeSecurityGroupIngress",
				"ec2:RevokeSecurityGroupEgress",
				"ec2:CreateKeyPair",
				"ec2:DeleteKeyPair",
				"ec2:DescribeKeyPairs",
				"ec2:ImportKeyPair",
				"ec2:RunInstances",
				"ec2:TerminateInstances",
				"ec2:DescribeInstances",
				"ec2:DescribeInstanceAttribute",
				"ec2:AllocateAddress",
				"ec2:ReleaseAddress",
				"ec2:DescribeAddresses",
				"ec2:AssociateAddress",
				"ec2:DisassociateAddress",
				"ec2:CreateTags",
				"ec2:DescribeTags",
				"ec2:DescribeAvailabilityZones",
				"ec2:DescribeImages",
				"ec2:DescribeVolumes",
				"ec2:DescribeInstanceCreditSpecifications",
				"ec2:DescribeNetworkInterfaces"
			],
			"Resource": "*"
		}
	]
}
```