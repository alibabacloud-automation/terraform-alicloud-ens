# ENS Network resources
resource "alicloud_ens_network" "network" {
  count         = var.create_network ? 1 : 0
  network_name  = var.network_config.network_name
  description   = var.network_config.description
  cidr_block    = var.network_config.cidr_block
  ens_region_id = var.network_config.ens_region_id
}

# ENS VSwitch resources
resource "alicloud_ens_vswitch" "vswitches" {
  for_each = var.create_vswitch ? var.vswitch_configs : {}

  vswitch_name  = each.value.vswitch_name
  description   = each.value.description
  cidr_block    = each.value.cidr_block
  ens_region_id = each.value.ens_region_id
  network_id    = var.create_network ? alicloud_ens_network.network[0].id : var.network_id
}

# ENS Security Group
resource "alicloud_ens_security_group" "security_group" {
  count               = var.create_security_group ? 1 : 0
  security_group_name = var.security_group_config.security_group_name
  description         = var.security_group_config.description
}

# ENS Key Pair
resource "alicloud_ens_key_pair" "key_pair" {
  count         = var.create_key_pair ? 1 : 0
  key_pair_name = var.key_pair_config.key_pair_name
  version       = var.key_pair_config.version
}

# ENS Instances
resource "alicloud_ens_instance" "instances" {
  for_each = var.create_instance ? var.instance_configs : {}

  instance_name              = each.value.instance_name
  instance_type              = each.value.instance_type
  image_id                   = each.value.image_id
  ens_region_id              = each.value.ens_region_id
  payment_type               = each.value.payment_type
  password                   = each.value.password
  key_pair_name              = each.value.key_pair_name
  schedule_area_level        = each.value.schedule_area_level
  scheduling_strategy        = each.value.scheduling_strategy
  period                     = each.value.period
  period_unit                = each.value.period_unit
  internet_max_bandwidth_out = each.value.internet_max_bandwidth_out
  public_ip_identification   = each.value.public_ip_identification
  host_name                  = each.value.host_name
  user_data                  = each.value.user_data
  vswitch_id                 = each.value.vswitch_id
  security_id                = var.create_security_group ? alicloud_ens_security_group.security_group[0].id : var.security_group_id

  dynamic "system_disk" {
    for_each = each.value.system_disk != null ? [each.value.system_disk] : []
    content {
      size     = system_disk.value.size
      category = system_disk.value.category
    }
  }

  dynamic "data_disk" {
    for_each = each.value.data_disks != null ? each.value.data_disks : []
    content {
      size     = data_disk.value.size
      category = data_disk.value.category
    }
  }
}

# ENS Instance Security Group Attachments
resource "alicloud_ens_instance_security_group_attachment" "attachments" {
  for_each = var.create_instance_security_group_attachment ? var.instance_security_group_attachment_configs : {}

  instance_id       = each.value.instance_id
  security_group_id = each.value.security_group_id
}

# ENS Disks
resource "alicloud_ens_disk" "disks" {
  for_each = var.create_disk ? var.disk_configs : {}

  category      = each.value.category
  size          = each.value.size
  payment_type  = each.value.payment_type
  ens_region_id = each.value.ens_region_id
  disk_name     = each.value.disk_name
  encrypted     = each.value.encrypted
  kms_key_id    = each.value.kms_key_id
  snapshot_id   = each.value.snapshot_id
}

# ENS Disk Instance Attachments
resource "alicloud_ens_disk_instance_attachment" "disk_attachments" {
  for_each = var.create_disk_instance_attachment ? var.disk_instance_attachment_configs : {}

  instance_id          = each.value.instance_id
  disk_id              = each.value.disk_id
  delete_with_instance = each.value.delete_with_instance
}

# ENS EIP
resource "alicloud_ens_eip" "eips" {
  for_each = var.create_eip ? var.eip_configs : {}

  eip_name             = each.value.eip_name
  description          = each.value.description
  bandwidth            = each.value.bandwidth
  isp                  = each.value.isp
  payment_type         = each.value.payment_type
  ens_region_id        = each.value.ens_region_id
  internet_charge_type = each.value.internet_charge_type
}

# ENS EIP Instance Attachments
resource "alicloud_ens_eip_instance_attachment" "eip_attachments" {
  for_each = var.create_eip_instance_attachment ? var.eip_instance_attachment_configs : {}

  allocation_id = each.value.allocation_id
  instance_id   = each.value.instance_id
  instance_type = each.value.instance_type
  standby       = each.value.standby
}

# ENS Load Balancer
resource "alicloud_ens_load_balancer" "load_balancer" {
  count              = var.create_load_balancer ? 1 : 0
  load_balancer_name = var.load_balancer_config.load_balancer_name
  payment_type       = var.load_balancer_config.payment_type
  ens_region_id      = var.load_balancer_config.ens_region_id
  load_balancer_spec = var.load_balancer_config.load_balancer_spec
  vswitch_id         = var.load_balancer_config.vswitch_id
  network_id         = var.create_network ? alicloud_ens_network.network[0].id : var.network_id

  dynamic "backend_servers" {
    for_each = var.load_balancer_config.backend_servers != null ? var.load_balancer_config.backend_servers : []
    content {
      server_id = backend_servers.value.server_id
      type      = backend_servers.value.type
      weight    = backend_servers.value.weight
      ip        = backend_servers.value.ip
      port      = backend_servers.value.port
    }
  }
}

# ENS NAT Gateway
resource "alicloud_ens_nat_gateway" "nat_gateway" {
  count         = var.create_nat_gateway ? 1 : 0
  nat_name      = var.nat_gateway_config.nat_name
  ens_region_id = var.nat_gateway_config.ens_region_id
  network_id    = var.create_network ? alicloud_ens_network.network[0].id : var.network_id
  vswitch_id    = var.nat_gateway_config.vswitch_id
  instance_type = var.nat_gateway_config.instance_type
}

# ENS Images
resource "alicloud_ens_image" "images" {
  for_each = var.create_image ? var.image_configs : {}

  image_name                = each.value.image_name
  instance_id               = each.value.instance_id
  delete_after_image_upload = each.value.delete_after_image_upload
  target_oss_region_id      = each.value.target_oss_region_id
}

# ENS Snapshots
resource "alicloud_ens_snapshot" "snapshots" {
  for_each = var.create_snapshot ? var.snapshot_configs : {}

  snapshot_name = each.value.snapshot_name
  description   = each.value.description
  disk_id       = each.value.disk_id
  ens_region_id = each.value.ens_region_id
}