variable ssh_key {}
variable name {}
variable number_master {}
variable number_nodes {}


module "vms" {
    source        = "./modules/vms"
    name          = var.name 
    private-net   = module.network.private-net
    ssh_key       = var.ssh_key
    number_master = var.number_master
    number_nodes  = var.number_nodes 
}

module "network" {
    source       = "./modules/network"
    name         = var.name
    loadbalancer = module.vms.loadbalancer
}
