output "loadbalancer" {
    value = module.vms.loadbalancer.public_ipv4_address
}

output "masters" {
    value = module.vms.masters
}

output "nodes" {
    value = module.vms.nodes
}

output "floatin-ip-loadbalancer" {
    value = module.network.floatin-ip-loadbalancer.id
}