output "loadbalancer" {
    value = "${cloudscale_server.loadbalancer}"
}


output "masters" {
    value = "${cloudscale_server.masters.*.public_ipv4_address}"
}

output "nodes" {
    value = "${cloudscale_server.nodes.*.public_ipv4_address}"
}