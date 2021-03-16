resource "openstack_networking_floatingip_v2" "public_ip_1" {
  pool = data.openstack_networking_network_v2.internet_network.name
}

output "public_ip_1" {
  value = openstack_networking_floatingip_v2.public_ip_1.address
}
