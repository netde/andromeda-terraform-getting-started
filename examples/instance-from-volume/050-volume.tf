resource "openstack_blockstorage_volume_v3" "volume_1" {
  name        = "${var.prefix}-vol1-instance1"
  description = "Boot volume for ${var.prefix}-instance1"
  size        = 15
  image_id    = "003c63e9-2f28-4803-9088-df5b5583a937" #net.DE Ubuntu 20.04 LTS x64 - 2021-02
}
