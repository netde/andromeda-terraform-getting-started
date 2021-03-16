resource "openstack_compute_secgroup_v2" "ssh" {
  name          = "${var.prefix}-ssh"
  description   = "Open input ssh port for ${var.prefix}"
  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = var.ssh_secgroup_allowed_hosts
  }
}

output "ssh_secgroup_name" {
  value = openstack_compute_secgroup_v2.ssh.name
}
