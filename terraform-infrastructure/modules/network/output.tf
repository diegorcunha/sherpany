output "private-net" {
    value = "${cloudscale_network.private-net}"
}

output "floatin-ip-loadbalancer" {
    value = "${cloudscale_floating_ip.loadbalancer}"
}
