## Overview

This project automates the deployment of a multi-region AWS infrastructure for a retail platform.

## Steps to Deploy

1. Install dependencies (Terraform, Ansible, AWS CLI)
2. Configure `terraform.tfvars`
3. Run `terraform init && terraform apply -auto-approve`
4. Retrieve public IPs (`terraform output`)
5. Configure `inventory.ini`
6. Run `ansible-playbook -i inventory.ini webserver.yml`
7. Test multi-region failover and scaling.
