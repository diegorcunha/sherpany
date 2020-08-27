#!/usr/bin/env sh

# deploy-ansible-k8s.sh: Setup the Kubernetes Cluster.
#
# Dependencies:
#   - Ansible
#   - jq


ROOTDIR="$PWD"
cd ansible-k8s

# Setup the Kubernetes Master Node.
ansible-playbook setup_master_node.yml

# Setup the Kubernetes Nodes.
ansible-playbook setup_worker_nodes.yml

