# instance-from-volume

This is just a simple example and will setup the following:

* Place your SSH public rsa key
* Create a security group that allows ssh on port 22 and associate it with the instance
* Create a network and a subnet in it
* Create a router and connect it to the subnet
* Create a volume from an image and make it bootable
* Start an instance from volume and associate an floating IP
