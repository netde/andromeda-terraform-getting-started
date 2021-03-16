resource "openstack_networking_port_v2" "port_1_instance1" {
  name               = "${var.prefix}-port_1_instance1"
  security_group_ids = [openstack_compute_secgroup_v2.andr_exp_rules.id]
  network_id         = openstack_networking_network_v2.andr_exp_net.id

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.andr_exp_subnet.id
    ip_address = cidrhost(var.network_cidr, 10 + 0)
  }

  allowed_address_pairs {
    ip_address = cidrhost(var.network_cidr, 10 + 10)
  }
}

resource "openstack_networking_port_v2" "port_1_instance2" {
  name               = "${var.prefix}-port_1_instance2"
  security_group_ids = [openstack_compute_secgroup_v2.andr_exp_rules.id]
  network_id         = openstack_networking_network_v2.andr_exp_net.id

  fixed_ip {
    subnet_id  = openstack_networking_subnet_v2.andr_exp_subnet.id
    ip_address = cidrhost(var.network_cidr, 10 + 1)
  }

  allowed_address_pairs {
    ip_address = cidrhost(var.network_cidr, 10 + 10)
  }
}

resource "openstack_compute_instance_v2" "instance1" {
  name               = "${var.prefix}-instance1"
  image_name         = var.image
  flavor_name        = var.flavor
  key_pair           = openstack_compute_keypair_v2.ssh_keypair.name
  availability_zone  = var.availability_zone

  user_data          = templatefile("${path.module}/templates/cloud-init.tpl", { network_short = var.network_short, prefix = var.prefix })

  network {
    port             = openstack_networking_port_v2.port_1_instance1.id
  }
}

resource "openstack_compute_instance_v2" "instance2" {
  name               = "${var.prefix}-instance2"
  image_name         = var.image
  flavor_name        = var.flavor
  key_pair           = openstack_compute_keypair_v2.ssh_keypair.name
  availability_zone  = var.availability_zone

  user_data          = templatefile("${path.module}/templates/cloud-init.tpl", { network_short = var.network_short, prefix = var.prefix })

  network {
    port             = openstack_networking_port_v2.port_1_instance2.id
  }
}

output "ip_instance1" {
  value = openstack_networking_port_v2.port_1_instance1.all_fixed_ips
}
