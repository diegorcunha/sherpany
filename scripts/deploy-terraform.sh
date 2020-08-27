#!/usr/bin/env sh

# deploy.terraform.sh: Apply the terraform code.
#
# Dependencies:
#   - terraform 0.12
#   - jq




if [ $# -ne 1 ] || [ "$1" = "--help" ] ; then
    echo "usage: $0 VARIABLE"
    echo "  Set the environment variable to apply in correct environment."
    echo ""
    echo "  : *-environment.tfvars the variable environment."
    echo ""
    exit 1
fi

set -e

VARIABLE="$1"
ROOTDIR="$PWD"
cd terraform-infrastructure

# Applying the terraform code.
terraform apply -var-file=env/$VARIABLE -auto-approve


# Create the hosts.ini file
{

    echo "[masters]"
    terraform output -json  | jq '.masters.value[0]'
    echo ""
    echo "[nodes]"
    terraform output -json  | jq '.nodes.value[0]'
    terraform output -json  | jq '.nodes.value[1]'
    echo ""
    echo "[loadbalancer]"
    terraform output -json  | jq '.loadbalancer.value'
    echo ""
    echo "[floatingip]"
    terraform output -json  | jq '."floatin-ip-loadbalancer".value'
    echo ""
    echo "[all:vars]"
    echo "ansible_user=ubuntu"
    
} > "$ROOTDIR/hosts.ini"
