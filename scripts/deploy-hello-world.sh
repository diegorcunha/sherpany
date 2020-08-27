#!/usr/bin/env sh

# deploy-hello-world.yml: Setup Hello World example
#
# Dependencies:
#   - Ansible
#   - jq


ROOTDIR="$PWD"
cd ansible-k8s

# Setup the Loadbalancer.
ansible-playbook deploy-hello-world.yml



