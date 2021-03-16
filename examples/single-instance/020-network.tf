resource "openstack_networking_network_v2" "andr_exp_net" {
  name    = "${var.prefix}-net"
}

resource "openstack_networking_subnet_v2" "andr_exp_subnet" {
  name            = "${var.prefix}-subnet"
  network_id      = openstack_networking_network_v2.andr_exp_net.id
  cidr            = var.network_cidr
  ip_version      = 4
  enable_dhcp     = true
}
