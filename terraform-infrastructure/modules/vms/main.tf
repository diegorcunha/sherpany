resource "cloudscale_server" "masters" {
  count               = var.number_master
  name                = "${var.name}-master-0${count.index}"
  flavor_slug         = "flex-4"
  image_slug          = "ubuntu-18.04"
  volume_size_gb      = 10
  ssh_keys            = ["${var.ssh_key}"]
  allow_stopping_for_update = true
  interfaces {
    type              = "public"
  }
  interfaces {
    type              = "private"
    network_uuid      = var.private-net.id
    }
}

resource "cloudscale_server" "nodes" {
  count               = var.number_nodes
  name                = "nodes-0${count.index}"
  flavor_slug         = "flex-4"
  image_slug          = "ubuntu-18.04"
  volume_size_gb      = 10
  ssh_keys            = ["${var.ssh_key}"]
  allow_stopping_for_update = true
  interfaces {
    type              = "public"
  }
  interfaces {
    type              = "private"
    network_uuid      = var.private-net.id
    }
}

resource "cloudscale_server" "loadbalancer" {
  name                = "${var.name}-loadbalancer"
  flavor_slug         = "flex-2"
  image_slug          = "ubuntu-18.04"
  volume_size_gb      = 10
  ssh_keys            = ["${var.ssh_key}"]
  allow_stopping_for_update = true
  interfaces {
    type              = "public"
  }
  interfaces {
    type              = "private"
    network_uuid      = var.private-net.id
    }
}
