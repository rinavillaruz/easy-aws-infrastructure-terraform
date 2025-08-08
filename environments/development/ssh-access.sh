#!/bin/bash
chmod 600 terraform-key-pair.pem
eval "$(ssh-agent -s)"
ssh-add terraform-key-pair.pem
ssh -i terraform-key-pair.pem -A -o StrictHostKeyChecking=no ubuntu@IP