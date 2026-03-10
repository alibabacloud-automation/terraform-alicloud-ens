# Network configuration
variable "create_network" {
  description = "Whether to create a new ENS network. If false, an existing network ID must be provided."
  type        = bool
  default     = true
}

variable "network_id" {
  description = "The ID of an existing ENS network. Required when create_network is false."
  type        = string
  default     = null
}

variable "network_config" {
  description = "Configuration for ENS network. Required when create_network is true."
  type = object({
    network_name  = optional(string, "default-ens-network")
    description   = optional(string, "ENS network created by Terraform")
    cidr_block    = string
    ens_region_id = string
  })
  default = null
}

# VSwitch configuration
variable "create_vswitch" {
  description = "Whether to create ENS vswitches."
  type        = bool
  default     = true
}

variable "vswitch_configs" {
  description = "Map of vswitch configurations."
  type = map(object({
    vswitch_name  = optional(string, "default-ens-vswitch")
    description   = optional(string, "ENS vswitch created by Terraform")
    cidr_block    = string
    ens_region_id = string
  }))
  default = {}
}

# Security Group configuration
variable "create_security_group" {
  description = "Whether to create a new ENS security group. If false, an existing security group ID must be provided."
  type        = bool
  default     = true
}

variable "security_group_id" {
  description = "The ID of an existing ENS security group. Required when create_security_group is false."
  type        = string
  default     = null
}

variable "security_group_config" {
  description = "The parameters of ENS security group."
  type = object({
    security_group_name = optional(string, "default-ens-security-group")
    description         = optional(string, "ENS security group created by Terraform")
  })
  default = {}
}

# Key Pair configuration
variable "create_key_pair" {
  description = "Whether to create an ENS key pair."
  type        = bool
  default     = false
}

variable "key_pair_config" {
  description = "Configuration for ENS key pair. Required when create_key_pair is true."
  type = object({
    key_pair_name = string
    version       = optional(string, "2017-11-10")
  })
  default = null
}

# Instance configuration
variable "create_instance" {
  description = "Whether to create ENS instances."
  type        = bool
  default     = false
}

variable "instance_configs" {
  description = "Map of ENS instance configurations."
  type = map(object({
    instance_name              = optional(string, "default-ens-instance")
    instance_type              = string
    image_id                   = string
    ens_region_id              = string
    payment_type               = optional(string, "PayAsYouGo")
    password                   = optional(string, null)
    key_pair_name              = optional(string, null)
    schedule_area_level        = optional(string, "Region")
    scheduling_strategy        = optional(string, "Concentrate")
    period                     = optional(number, null)
    period_unit                = optional(string, "Month")
    internet_max_bandwidth_out = optional(number, null)
    public_ip_identification   = optional(bool, true)
    host_name                  = optional(string, null)
    user_data                  = optional(string, null)
    vswitch_id                 = optional(string, null)
    system_disk = optional(object({
      size     = optional(number, 20)
      category = optional(string, "cloud_efficiency")
    }), null)
    data_disks = optional(list(object({
      size     = number
      category = optional(string, "cloud_efficiency")
    })), null)
  }))
  default = {}
}

# Instance Security Group Attachment configuration
variable "create_instance_security_group_attachment" {
  description = "Whether to create ENS instance security group attachments."
  type        = bool
  default     = false
}

variable "instance_security_group_attachment_configs" {
  description = "Map of ENS instance security group attachment configurations."
  type = map(object({
    instance_id       = string
    security_group_id = string
  }))
  default = {}
}

# Disk configuration
variable "create_disk" {
  description = "Whether to create ENS disks."
  type        = bool
  default     = false
}

variable "disk_configs" {
  description = "Map of ENS disk configurations."
  type = map(object({
    category      = string
    size          = string
    payment_type  = string
    ens_region_id = string
    disk_name     = optional(string, null)
    encrypted     = optional(bool, false)
    kms_key_id    = optional(string, null)
    snapshot_id   = optional(string, null)
  }))
  default = {}
}

# Disk Instance Attachment configuration
variable "create_disk_instance_attachment" {
  description = "Whether to create ENS disk instance attachments."
  type        = bool
  default     = false
}

variable "disk_instance_attachment_configs" {
  description = "Map of ENS disk instance attachment configurations."
  type = map(object({
    instance_id          = string
    disk_id              = string
    delete_with_instance = optional(string, "false")
  }))
  default = {}
}

# EIP configuration
variable "create_eip" {
  description = "Whether to create ENS EIPs."
  type        = bool
  default     = false
}

variable "eip_configs" {
  description = "Map of ENS EIP configurations."
  type = map(object({
    eip_name             = optional(string, "default-ens-eip")
    description          = optional(string, "ENS EIP created by Terraform")
    bandwidth            = optional(string, "5")
    isp                  = optional(string, "cmcc")
    payment_type         = string
    ens_region_id        = string
    internet_charge_type = string
  }))
  default = {}
}

# EIP Instance Attachment configuration
variable "create_eip_instance_attachment" {
  description = "Whether to create ENS EIP instance attachments."
  type        = bool
  default     = false
}

variable "eip_instance_attachment_configs" {
  description = "Map of ENS EIP instance attachment configurations."
  type = map(object({
    allocation_id = string
    instance_id   = string
    instance_type = optional(string, "EnsInstance")
    standby       = optional(string, "false")
  }))
  default = {}
}

# Load Balancer configuration
variable "create_load_balancer" {
  description = "Whether to create an ENS load balancer."
  type        = bool
  default     = false
}

variable "load_balancer_config" {
  description = "Configuration for ENS load balancer. Required when create_load_balancer is true."
  type = object({
    load_balancer_name = optional(string, "default-ens-lb")
    payment_type       = string
    ens_region_id      = string
    load_balancer_spec = string
    vswitch_id         = string
    backend_servers = optional(list(object({
      server_id = string
      type      = optional(string, "ens")
      weight    = optional(number, 100)
      ip        = optional(string, null)
      port      = optional(number, null)
    })), null)
  })
  default = null
}

# NAT Gateway configuration
variable "create_nat_gateway" {
  description = "Whether to create an ENS NAT gateway."
  type        = bool
  default     = false
}

variable "nat_gateway_config" {
  description = "Configuration for ENS NAT gateway. Required when create_nat_gateway is true."
  type = object({
    nat_name      = optional(string, "default-ens-nat")
    ens_region_id = string
    vswitch_id    = string
    instance_type = optional(string, "enat.default")
  })
  default = null
}

# Image configuration
variable "create_image" {
  description = "Whether to create ENS images."
  type        = bool
  default     = false
}

variable "image_configs" {
  description = "Map of ENS image configurations."
  type = map(object({
    image_name                = string
    instance_id               = optional(string, null)
    delete_after_image_upload = optional(string, "false")
    target_oss_region_id      = optional(string, null)
  }))
  default = {}
}

# Snapshot configuration
variable "create_snapshot" {
  description = "Whether to create ENS snapshots."
  type        = bool
  default     = false
}

variable "snapshot_configs" {
  description = "Map of ENS snapshot configurations."
  type = map(object({
    snapshot_name = string
    description   = optional(string, "ENS snapshot created by Terraform")
    disk_id       = string
    ens_region_id = string
  }))
  default = {}
}