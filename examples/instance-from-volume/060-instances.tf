
resource "openstack_compute_instance_v2" "instance1" {
  name               = "${var.prefix}-instance1"
  flavor_name        = var.flavor
  key_pair           = openstack_compute_keypair_v2.ssh_keypair.name
  security_groups    = [ "default",
                         openstack_compute_secgroup_v2.ssh.name]
  availability_zone  = var.availability_zone

  network {
    name             = openstack_networking_network_v2.andr_exp_net.name
    fixed_ip_v4      = cidrhost(var.network_cidr, 10 + 0)
  }

  block_device {
    uuid                  = openstack_blockstorage_volume_v3.volume_1.id
    source_type           = "volume"
    boot_index            = 0
    destination_type      = "volume"
  }
}

resource "openstack_compute_floatingip_associate_v2" "public_ip_1" {
  floating_ip = openstack_networking_floatingip_v2.public_ip_1.address
  instance_id = openstack_compute_instance_v2.instance1.id
}
