# Network outputs
output "network_id" {
  description = "The ID of the created ENS network"
  value       = module.ens_example.network_id
}

output "network_name" {
  description = "The name of the created ENS network"
  value       = module.ens_example.network_name
}

# VSwitch outputs
output "vswitch_ids" {
  description = "The IDs of the created ENS vswitches"
  value       = module.ens_example.vswitch_ids
}

output "vswitch_names" {
  description = "The names of the created ENS vswitches"
  value       = module.ens_example.vswitch_names
}

# Security Group outputs
output "security_group_id" {
  description = "The ID of the created ENS security group"
  value       = module.ens_example.security_group_id
}

output "security_group_name" {
  description = "The name of the created ENS security group"
  value       = module.ens_example.security_group_name
}

# Instance outputs
output "instance_ids" {
  description = "The IDs of the created ENS instances"
  value       = module.ens_example.instance_ids
}

output "instance_names" {
  description = "The names of the created ENS instances"
  value       = module.ens_example.instance_names
}

output "instance_status" {
  description = "The status of the created ENS instances"
  value       = module.ens_example.instance_status
}

# EIP outputs
output "eip_ids" {
  description = "The IDs of the created ENS EIPs"
  value       = module.ens_example.eip_ids
}

output "eip_names" {
  description = "The names of the created ENS EIPs"
  value       = module.ens_example.eip_names
}

# Load Balancer outputs
output "load_balancer_id" {
  description = "The ID of the created ENS load balancer"
  value       = module.ens_example.load_balancer_id
}

output "load_balancer_name" {
  description = "The name of the created ENS load balancer"
  value       = module.ens_example.load_balancer_name
}