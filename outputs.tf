output "admin_username" {
  description = "admin username"
  value       = "${module.dcos-public-agent-instances.admin_username}"
}

# Private IP Addresses
output "private_ips" {
  description = "List of private ip addresses created by this module"
  value       = ["${module.dcos-public-agent-instances.private_ips}"]
}

# Public IP Addresses
output "public_ips" {
  description = "List of public ip addresses created by this module"
  value       = ["${module.dcos-public-agent-instances.public_ips}"]
}

# Returns the ID of the prereq script
output "prereq_id" {
  description = "prereq id"
  value       = "${module.dcos-public-agent-instances.prereq_id}"
}
