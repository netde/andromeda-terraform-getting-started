variable "auth_url"	{
  description = "Andromeda identity v3 URL used for authentication"
  type        = string
  default     = "https://identity-de-haj-1.api.andromeda.net.de:5000/v3/"
}

variable "domain_name" {
  description = "Andromeda domain where your user is associated with."
  type        = string
}

variable "username" {
  description = "Your username."
  type        = string
}

variable "project_name" {
  description = "Project in which all the resources be created."
  type        = string
}

variable "region" {
  description = "Andromeda region where your project is located"
  type        = string
  default     = "de-haj-1"
}

variable "password" {
  description = "Your password"
  type        = string
  sensitive   = true
}

variable "prefix" {
  description = "Prefix for your ressource names"
  type        = string
  default     = "andr-exp"
}

variable "ssh_keypair" {
  description = "SSH public key used to connect to instances"
  type        = string
}

variable "ssh_secgroup_allowed_hosts" {
  description = "Hosts allowed to ssh into instances"
  type        = string
  default     = "0.0.0.0/0"
}

variable "network_cidr" {
  description = "Network CIDR to use"
  type        = string
  default     = "192.168.1.0/24"
}

variable "internet_network_name" {
  description = "Andromeda network name for internet and aquiring floating IPs"
  type        = string
  default     = "internet"
}

variable "availability_zone" {
  description = "Andromeda availability zone to use"
  type        = string
  default     = "AZ1"
}

variable "flavor" {
  description = "Andromeda flavor to use"
  type        = string
  default     = "t1.medium"
}

variable "image" {
  description = "Andromeda operating system image to use"
  type        = string
  default     = "net.DE Ubuntu 20.04 LTS x64 - 2021-02"
}
