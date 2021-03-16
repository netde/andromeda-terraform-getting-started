data "openstack_networking_network_v2" "internet_network" {
  name = var.internet_network_name
}

resource "openstack_networking_router_v2" "router_internet" {
  name                = "${var.prefix}-router"
  external_network_id = data.openstack_networking_network_v2.internet_network.id
}

resource "openstack_networking_router_interface_v2" "router_internet_network_interface" {
  router_id = openstack_networking_router_v2.router_internet.id
  subnet_id = openstack_networking_subnet_v2.andr_exp_subnet.id
}
