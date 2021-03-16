# vrrp-address-pair

This example will deploy an high available instance pair using VRRP. To get VRRP working we use OpenStack `allowed_address_pairs`. Allowed Address Pairs the port attribute to enable you to specify arbitrary `mac_address/ip_address(cidr)` pairs that are allowed to pass-through a port, regardless of the subnet associated with the network.

For managing security groups in terraform normaly the resource `openstack_compute_secgroup_v2` is used. For allowing VRRP traffic (IP protocol 112) we need to use `openstack_networking_secgroup_v2` and `openstack_networking_secgroup_rule_v2` terraform resources instead. A floating IP is associated with the VRRP VIP address.

On instance creation a shell script is injected via cloud-init to setup VRRP (keepalived) and Apache web server on instances.

After running terraform (and wait a bit) open a web browser and a go to `http://FLOATING-IP-SHOWN-BY-TERRAFORM`.
