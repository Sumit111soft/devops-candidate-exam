#!/bin/bash
git clone "https://github.com/hashicorp/terraform.git"
cd terraform
go install
echo "terraform -version"
