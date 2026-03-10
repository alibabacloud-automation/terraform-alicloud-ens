# Network outputs
output "network_id" {
  description = "The ID of the ENS network"
  value       = var.create_network ? alicloud_ens_network.network[0].id : null
}

output "network_name" {
  description = "The name of the ENS network"
  value       = var.create_network ? alicloud_ens_network.network[0].network_name : null
}

output "network_status" {
  description = "The status of the ENS network"
  value       = var.create_network ? alicloud_ens_network.network[0].status : null
}

output "network_create_time" {
  description = "The creation time of the ENS network"
  value       = var.create_network ? alicloud_ens_network.network[0].create_time : null
}

# VSwitch outputs
output "vswitch_ids" {
  description = "The IDs of the ENS vswitches"
  value       = { for k, v in alicloud_ens_vswitch.vswitches : k => v.id }
}

output "vswitch_names" {
  description = "The names of the ENS vswitches"
  value       = { for k, v in alicloud_ens_vswitch.vswitches : k => v.vswitch_name }
}

output "vswitch_status" {
  description = "The status of the ENS vswitches"
  value       = { for k, v in alicloud_ens_vswitch.vswitches : k => v.status }
}

# Security Group outputs
output "security_group_id" {
  description = "The ID of the ENS security group"
  value       = var.create_security_group ? alicloud_ens_security_group.security_group[0].id : null
}

output "security_group_name" {
  description = "The name of the ENS security group"
  value       = var.create_security_group ? alicloud_ens_security_group.security_group[0].security_group_name : null
}

# Key Pair outputs
output "key_pair_id" {
  description = "The ID of the ENS key pair"
  value       = var.create_key_pair ? alicloud_ens_key_pair.key_pair[0].id : null
}

output "key_pair_name" {
  description = "The name of the ENS key pair"
  value       = var.create_key_pair ? alicloud_ens_key_pair.key_pair[0].key_pair_name : null
}

# Instance outputs
output "instance_ids" {
  description = "The IDs of the ENS instances"
  value       = { for k, v in alicloud_ens_instance.instances : k => v.id }
}

output "instance_names" {
  description = "The names of the ENS instances"
  value       = { for k, v in alicloud_ens_instance.instances : k => v.instance_name }
}

output "instance_status" {
  description = "The status of the ENS instances"
  value       = { for k, v in alicloud_ens_instance.instances : k => v.status }
}

output "instance_data_disk_ids" {
  description = "The data disk IDs of the ENS instances"
  value       = { for k, v in alicloud_ens_instance.instances : k => v.data_disk }
}

# Instance Security Group Attachment outputs
output "instance_security_group_attachment_ids" {
  description = "The IDs of the ENS instance security group attachments"
  value       = { for k, v in alicloud_ens_instance_security_group_attachment.attachments : k => v.id }
}

# Disk outputs
output "disk_ids" {
  description = "The IDs of the ENS disks"
  value       = { for k, v in alicloud_ens_disk.disks : k => v.id }
}

output "disk_names" {
  description = "The names of the ENS disks"
  value       = { for k, v in alicloud_ens_disk.disks : k => v.disk_name }
}

output "disk_status" {
  description = "The status of the ENS disks"
  value       = { for k, v in alicloud_ens_disk.disks : k => v.status }
}

output "disk_create_time" {
  description = "The creation time of the ENS disks"
  value       = { for k, v in alicloud_ens_disk.disks : k => v.create_time }
}

# Disk Instance Attachment outputs
output "disk_instance_attachment_ids" {
  description = "The IDs of the ENS disk instance attachments"
  value       = { for k, v in alicloud_ens_disk_instance_attachment.disk_attachments : k => v.id }
}

# EIP outputs
output "eip_ids" {
  description = "The IDs of the ENS EIPs"
  value       = { for k, v in alicloud_ens_eip.eips : k => v.id }
}

output "eip_names" {
  description = "The names of the ENS EIPs"
  value       = { for k, v in alicloud_ens_eip.eips : k => v.eip_name }
}

output "eip_status" {
  description = "The status of the ENS EIPs"
  value       = { for k, v in alicloud_ens_eip.eips : k => v.status }
}

output "eip_create_time" {
  description = "The creation time of the ENS EIPs"
  value       = { for k, v in alicloud_ens_eip.eips : k => v.create_time }
}

# EIP Instance Attachment outputs
output "eip_instance_attachment_ids" {
  description = "The IDs of the ENS EIP instance attachments"
  value       = { for k, v in alicloud_ens_eip_instance_attachment.eip_attachments : k => v.id }
}

output "eip_instance_attachment_status" {
  description = "The status of the ENS EIP instance attachments"
  value       = { for k, v in alicloud_ens_eip_instance_attachment.eip_attachments : k => v.status }
}

# Load Balancer outputs
output "load_balancer_id" {
  description = "The ID of the ENS load balancer"
  value       = var.create_load_balancer ? alicloud_ens_load_balancer.load_balancer[0].id : null
}

output "load_balancer_name" {
  description = "The name of the ENS load balancer"
  value       = var.create_load_balancer ? alicloud_ens_load_balancer.load_balancer[0].load_balancer_name : null
}

output "load_balancer_status" {
  description = "The status of the ENS load balancer"
  value       = var.create_load_balancer ? alicloud_ens_load_balancer.load_balancer[0].status : null
}

output "load_balancer_create_time" {
  description = "The creation time of the ENS load balancer"
  value       = var.create_load_balancer ? alicloud_ens_load_balancer.load_balancer[0].create_time : null
}

# NAT Gateway outputs
output "nat_gateway_id" {
  description = "The ID of the ENS NAT gateway"
  value       = var.create_nat_gateway ? alicloud_ens_nat_gateway.nat_gateway[0].id : null
}

output "nat_gateway_name" {
  description = "The name of the ENS NAT gateway"
  value       = var.create_nat_gateway ? alicloud_ens_nat_gateway.nat_gateway[0].nat_name : null
}

output "nat_gateway_create_time" {
  description = "The creation time of the ENS NAT gateway"
  value       = var.create_nat_gateway ? alicloud_ens_nat_gateway.nat_gateway[0].create_time : null
}

# Image outputs
output "image_ids" {
  description = "The IDs of the ENS images"
  value       = { for k, v in alicloud_ens_image.images : k => v.id }
}

output "image_names" {
  description = "The names of the ENS images"
  value       = { for k, v in alicloud_ens_image.images : k => v.image_name }
}

output "image_status" {
  description = "The status of the ENS images"
  value       = { for k, v in alicloud_ens_image.images : k => v.status }
}

output "image_create_time" {
  description = "The creation time of the ENS images"
  value       = { for k, v in alicloud_ens_image.images : k => v.create_time }
}

# Snapshot outputs
output "snapshot_ids" {
  description = "The IDs of the ENS snapshots"
  value       = { for k, v in alicloud_ens_snapshot.snapshots : k => v.id }
}

output "snapshot_names" {
  description = "The names of the ENS snapshots"
  value       = { for k, v in alicloud_ens_snapshot.snapshots : k => v.snapshot_name }
}

output "snapshot_status" {
  description = "The status of the ENS snapshots"
  value       = { for k, v in alicloud_ens_snapshot.snapshots : k => v.status }
}

output "snapshot_create_time" {
  description = "The creation time of the ENS snapshots"
  value       = { for k, v in alicloud_ens_snapshot.snapshots : k => v.create_time }
}