#!/usr/bin/env python3
import json
import os

inventory_file = os.path.join(os.path.dirname(__file__), "inventory.json")

if not os.path.exists(inventory_file):
    print("Error: inventory.json not found")
    exit(1)

with open(inventory_file, "r") as f:
    tf_output = json.load(f)

primary_ip = tf_output.get("web_primary_ip", {}).get("value", "")
secondary_ip = tf_output.get("web_secondary_ip", {}).get("value", "")
db_host = tf_output.get("db_host", {}).get("value", "")
db_password_secret_arn = tf_output.get("db_password_secret_arn", {}).get("value", "")

inventory = {
    "_meta": {
        "hostvars": {
            primary_ip: {
                "ansible_user": "ec2-user",
                "ansible_ssh_private_key_file": "~/.ssh/trojan.pem",
                "db_host": db_host,
                "db_password_secret_arn": db_password_secret_arn
            },
            secondary_ip: {
                "ansible_user": "ec2-user",
                "ansible_ssh_private_key_file": "~/.ssh/trojan.pem",
                "db_host": db_host,
                "db_password_secret_arn": db_password_secret_arn
            }
        }
    },
    "all": {
        "children": ["webservers"]
    },
    "webservers": {
        "hosts": [primary_ip, secondary_ip]
    }
}

inventory["_meta"]["hostvars"] = {k: v for k, v in inventory["_meta"]["hostvars"].items() if k}
inventory["webservers"]["hosts"] = [h for h in inventory["webservers"]["hosts"] if h]

print(json.dumps(inventory, indent=4))