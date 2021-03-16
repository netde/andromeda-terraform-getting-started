# andromeda-terraform

Terraform examples using net.DE Andromeda Cloud based on OpenStack.

#### Table of Contents

1. [Requirements](#requirements)
1. [Available examples](#available-examples)
1. [Usage](#usage)
1. [FAQ](#faq)


## Requirements

You need to met the following requirements in order to use this examples.

* net.DE Andromeda hosting. You can get it [here](https://www.net.de/cloud#contactform)
* Terraform >= 0.14

## Available examples

| Example name | Description | |
| :--- | :--- | :--- |
| single-instance | A very basic example. Create a router, network and instance with floating IP. | [Readme](examples/single-instance/Readme.md) |
| instance-from-volume | Basic example booting an instance from volume | [Readme](examples/instance-from-volume/Readme.md) |
| vrrp-address-pair | Bring up keepalived with a VIP using OpenStack address-pair | [Readme](examples/vrrp-address-pair/Readme.md) |

Note: For all examples we use the network `192.168.1.0/24`. Make sure you use it not already in your Andromeda project.

## Usage

First place your public ssh rsa key in `.tfvars` file you want to use. Otherwise you won't be able to login to your instance.

Using a example is pretty easy.

```shell
cd examples/EXAMPLE-NAME
terraform init
terraform plan --var-file="../EXAMPLE-NAME.tfvars"
terraform apply --var-file="../EXAMPLE-NAME.tfvars"
```

After terraform is run successfully wait a bit until instances are booted. The floating IP associate with your instances is displayed after each terraform run.

To remove everything from your project do:

```shell
terraform destroy --var-file="../EXAMPLE-NAME.tfvars"
```

## FAQ

**Q: I use the network `192.168.1.0/24` in my project already. Can I change the network?**

A: Yes, you can. In `.tfvars` file you want to use add an overwrite for `network_cidr` and `network_short` variable:

```
network_cidr  = "172.31.1.0/24"
network_short = "172.31.1"
```
