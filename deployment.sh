#!/usr/bin/env sh

# deployment.sh: Download the ca.crt and ca.key to create the VPN profiles.
#
# Dependencies:
#   - terraform 0.12
#   - jq
#   - ansible



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

echo "Applying the Terraform..."
echo ""
command scripts/deploy-terraform.sh $VARIABLE
echo ""
echo "done!"

echo "Deploying the Kubernetes Cluster..."
echo ""
command scripts/deploy-ansible-k8s.sh
echo ""
echo "done!"

echo "Deploying the haproxy..."
echo ""
command scripts/deploy-ansible-haproxy.sh
echo ""
echo "done!"

echo "Deploying the Hello World..."
echo ""
command scripts/deploy-hello-world.sh
echo ""
echo "done!"

