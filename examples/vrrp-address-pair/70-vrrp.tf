resource "openstack_networking_port_v2" "vrrp1" {
  name               = "${var.prefix}-vrrp1"
  network_id         = openstack_networking_network_v2.andr_exp_net.id

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.andr_exp_subnet.id
    ip_address = cidrhost(var.network_cidr, 10 + 10)
  }
}

resource "openstack_networking_floatingip_associate_v2" "vrrp1_public_ip_1" {
  floating_ip = openstack_networking_floatingip_v2.public_ip_1.address
  port_id     = openstack_networking_port_v2.vrrp1.id
}
