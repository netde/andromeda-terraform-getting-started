
resource "openstack_compute_keypair_v2" "ssh_keypair" {
  name       = "${var.prefix}-ssh-keypair"
  public_key = var.ssh_keypair
}

output "ssh_keypair_name" {
  value = openstack_compute_keypair_v2.ssh_keypair.id
}
