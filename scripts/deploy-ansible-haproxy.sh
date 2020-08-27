#!/usr/bin/env sh

# deploy-ansible-haproxy.sh: Setup the HA Proxy Loadbalancer.
#
# Dependencies:
#   - Ansible
#   - jq


ROOTDIR="$PWD"
cd ansible-haproxy

# Setup the Loadbalancer.
ansible-playbook deploy-haproxy.yml



