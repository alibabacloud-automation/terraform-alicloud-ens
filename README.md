Alibaba Cloud ENS (Edge Node Service) Terraform Module

# terraform-alicloud-ens

English | [简体中文](https://github.com/alibabacloud-automation/terraform-alicloud-ens/blob/main/README-CN.md)

Terraform module which creates Edge Node Service (ENS) resources on Alibaba Cloud. This module provides comprehensive ENS infrastructure deployment capabilities for edge computing scenarios, enabling low-latency computing services at the network edge. ENS is designed to provide computing resources closer to end users, reducing network latency and improving application performance. For more information about ENS, see [Edge Node Service](https://www.alibabacloud.com/help/en/ens/).

## Usage

This module can be used to deploy a complete ENS infrastructure including network, instances, storage, and load balancing components.

```terraform
module "ens" {
  source = "alibabacloud-automation/ens/alicloud"

  # Network configuration
  create_network = true
  network_config = {
    network_name  = "example-ens-network"
    description   = "ENS network for edge computing"
    cidr_block    = "192.168.0.0/16"
    ens_region_id = "cn-chenzhou-telecom_unicom_cmcc"
  }

  # VSwitch configuration
  create_vswitch = true
  vswitch_configs = {
    "main" = {
      vswitch_name  = "example-ens-vswitch"
      description   = "Main ENS vswitch"
      cidr_block    = "192.168.1.0/24"
      ens_region_id = "cn-chenzhou-telecom_unicom_cmcc"
    }
  }

  # Security Group configuration
  create_security_group = true
  security_group_config = {
    security_group_name = "example-ens-sg"
    description         = "ENS security group"
  }

  # Instance configuration
  create_instance = true
  instance_configs = {
    "web" = {
      instance_name              = "example-ens-web"
      instance_type              = "ens.sn1.stiny"
      image_id                   = "centos_6_08_64_20G_alibase_20171208"
      ens_region_id              = "cn-chenzhou-telecom_unicom_cmcc"
      payment_type               = "PayAsYouGo"
      schedule_area_level        = "Region"
      scheduling_strategy        = "Concentrate"
      internet_max_bandwidth_out = 10
      public_ip_identification   = true
      system_disk = {
        size     = 20
        category = "cloud_efficiency"
      }
    }
  }
}
```

## Examples

* [Complete Example](https://github.com/alibabacloud-automation/terraform-alicloud-ens/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->

## Submit Issues

If you have any problems when using this module, please opening
a [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend opening an issue on this repo.

## Authors

Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com).

## License

MIT Licensed. See LICENSE for full details.

## Reference

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)