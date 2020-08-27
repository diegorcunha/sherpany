resource "cloudscale_floating_ip" "loadbalancer" {
  server      = var.loadbalancer.id
  ip_version  = 4
  reverse_ptr = "vip.${var.loadbalancer.name}.example.com"
}
