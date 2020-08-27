resource "cloudscale_network" "private-net" {
  name         = "${var.name}-private-net"
  zone_slug    = "lpg1"
  mtu          = "9000"
}

