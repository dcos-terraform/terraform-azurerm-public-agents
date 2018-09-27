# Number of Instance
output "num_public_agents" {
  value = "${var.num_public_agents}"
}

# Cluster Name
output "name_prefix" {
  value = "${var.name_prefix}"
}

# Instance Type
output "instance_type" {
  value = "${var.instance_type}"
}

# DCOS Version for prereq install
output "dcos_version" {
  value = "${var.dcos_version}"
}

# Tested OSes to install with prereq
output "dcos_instance_os" {
  value = "${var.dcos_instance_os}"
}

# Source image to boot from
output "image" {
  value = "${var.image}"
}

# Disk Type to Leverage
output "disk_type" {
  value = "${var.disk_type}"
}

# Disk Size in GB
output "disk_size" {
  value = "${var.disk_size}"
}

# Resource Group Name
output "resource_group_name" {
  value = "${var.resource_group_name}"
}

# Customer Provided Userdata
output "user_data" {
  value = "${var.user_data}"
}

# SSH User
output "admin_username" {
  value = "${module.dcos-pubagt-instances.admin_username}"
}

# SSH Public Key
output "public_ssh_key" {
  value = "${var.public_ssh_key}"
}

# Private IP Addresses
output "private_ips" {
  value = ["${module.dcos-pubagt-instances.private_ips}"]
}

# Public IP Addresses
output "public_ips" {
  value = ["${module.dcos-pubagt-instances.public_ips}"]
}

# Public Agent Load Balancer Address
output "lb.fqdn" {
  value = "${module.pubagt-lb.elb_address}"
}

# Returns the ID of the prereq script
output "prereq_id" {
  value = "${module.dcos-pubagt-instances.prereq_id}"
}
