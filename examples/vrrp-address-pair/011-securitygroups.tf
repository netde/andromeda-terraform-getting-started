resource "openstack_compute_secgroup_v2" "andr_exp_rules" {
  name          = "${var.prefix}-rules"
  description   = "Open input ssh,web, vrrp and icmp port for ${var.prefix}"
  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = var.ssh_secgroup_allowed_hosts
  }

  rule {
    from_port   = 80
    to_port     = 80
    ip_protocol = "tcp"
    cidr        = var.ssh_secgroup_allowed_hosts
  }

  rule {
    from_port   = -1
    to_port     = -1
    ip_protocol = "icmp"
    cidr        = var.ssh_secgroup_allowed_hosts
  }
}

resource "openstack_networking_secgroup_v2" "andr_exp_vrrp_rules" {
  name        = "${var.prefix}-vrrp-rules"
  description = "VRRP network rules"
}

resource "openstack_networking_secgroup_rule_v2" "andr_exp_vrrp_rule1" {
  direction         = "ingress"
  ethertype         = "IPv4"
  protocol          = "vrrp"
  security_group_id = openstack_networking_secgroup_v2.andr_exp_vrrp_rules.id
  remote_group_id   = openstack_compute_secgroup_v2.andr_exp_rules.id
}

output "ssh_secgroup_name" {
  value = openstack_compute_secgroup_v2.andr_exp_rules.name
}
