# Provider configuration
provider "alicloud" {}

# ENS Module usage example
module "ens_example" {
  source = "../../"

  # Network configuration
  # Note: Set create_network=true only if you have available network quota
  # Otherwise, provide an existing network ID via existing_network_id variable
  create_network = var.create_network
  network_id     = var.existing_network_id
  network_config = var.create_network ? {
    network_name  = var.example_name
    description   = "Example ENS network"
    cidr_block    = "192.168.0.0/16"
    ens_region_id = var.ens_region_id
  } : null

  # VSwitch configuration
  create_vswitch = true
  vswitch_configs = {
    "main" = {
      vswitch_name  = "${var.example_name}-vswitch"
      description   = "Example ENS vswitch"
      cidr_block    = "192.168.1.0/24"
      ens_region_id = var.ens_region_id
    }
  }

  # Security Group configuration
  create_security_group = true
  security_group_config = {
    security_group_name = "${var.example_name}-sg"
    description         = "Example ENS security group"
  }

  # Instance configuration
  create_instance = true
  instance_configs = {
    "web" = {
      instance_name              = "${var.example_name}-web"
      instance_type              = var.instance_type
      image_id                   = var.image_id
      ens_region_id              = var.ens_region_id
      payment_type               = "PayAsYouGo"
      password                   = var.instance_password
      schedule_area_level        = "Region"
      scheduling_strategy        = "Concentrate"
      internet_max_bandwidth_out = 10
      public_ip_identification   = true
      vswitch_id                 = module.ens_example.vswitch_ids["main"]
      system_disk = {
        size     = 20
        category = "cloud_efficiency"
      }
    }
  }

  # EIP configuration
  create_eip = var.create_eip
  eip_configs = var.create_eip ? {
    "web" = {
      eip_name             = "${var.example_name}-eip"
      description          = "Example ENS EIP"
      bandwidth            = "10"
      isp                  = "cmcc"
      payment_type         = "PayAsYouGo"
      ens_region_id        = var.ens_region_id
      internet_charge_type = "95BandwidthByMonth"
    }
  } : {}

  # EIP Instance Attachment configuration
  create_eip_instance_attachment = var.create_eip
  eip_instance_attachment_configs = var.create_eip ? {
    "web" = {
      allocation_id = module.ens_example.eip_ids["web"]
      instance_id   = module.ens_example.instance_ids["web"]
      instance_type = "EnsInstance"
      standby       = "false"
    }
  } : {}
}