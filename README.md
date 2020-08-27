# Deploy cluster Kubernetes on Cloudscale

### Prerequisites
##### Locally installed softwares:
+ **Docker**: build the Images
+ **Terraform**: Create the infrastructure
+ **Ansible**: Setup the Kubernetes on Vms

## Deployment
To create the environment is necessary to create the `SSH_KEY` and update in the file `dev-environment.tfvars` on the Folder `./terraform-infrastructure/env` after run the script `deployment.sh` with the environment variable:

Ex:

`./deployment.sh dev-environment.tfvars`

To create the `State` and the `Prod` environment is only necessary to change the variables file.

`./terraform-infrastructure/env/dev-environment.tfvars`

`./terraform-infrastructure/env/stage-environment.tfvars`

`./terraform-infrastructure/env/prod-environment.tfvars`

## Environments

### VMs on DEV Environment
The environment was created using the Terraform and the environment have:

* 1 Vm to K8S - Master
* 2 Vms to K8S - nodes
* 1 Vm to HaProxy - Load Balancer

The Linux distribution used was Ubuntu 18.04 - A personal preference.

### Network

The network was created using the Terraform and was create:

* Private subnet - To keep the Kubernete cluster only accessible internally.
* Floating IP - Create the floating IP to be used for the Loadbalancer.

### Kubernetes Cluster
The Cluster was create using the Ansible, the script install all the dependencies and setup the Master and join the Nodes to the Cluster.


### Loadbalancer
The Loadbalancer was create using the terraform to deploy the VM and Ansible to setup the application and services.

To accept the request and keep the Kubernetes cluster scalable was deployed one VM to run the HaProxy service and did the Loadbalancer service.

### Security
Because of the timeline was not possible deploy the environment using the best practices, but to improve the environment was necessary:

* Keep all the Cluster Kubernetes accessible only internally.
* Deploy the bastion VM to access the Kubernetes only throuth him.
* Limit the ssh of the Bastion only to my IP.
* Keep only the Loadbalancer VM with the external access limiting only acessible on the Port 80/443
* Using the Certificates to access the application using HTTPS.
