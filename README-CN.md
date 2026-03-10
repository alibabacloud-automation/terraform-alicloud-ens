阿里云边缘节点服务 (ENS) Terraform 模块

# terraform-alicloud-ens

[English](https://github.com/alibabacloud-automation/terraform-alicloud-ens/blob/main/README.md) | 简体中文

在阿里云上创建边缘节点服务 (ENS) 资源的 Terraform 模块。该模块为边缘计算场景提供全面的 ENS 基础设施部署能力，能够在网络边缘提供低延迟的计算服务。ENS 旨在为最终用户提供更近距离的计算资源，减少网络延迟并提高应用程序性能。有关 ENS 的更多信息，请参阅[边缘节点服务](https://www.alibabacloud.com/help/en/ens/)。

## 使用方法

该模块可用于部署完整的 ENS 基础设施，包括网络、实例、存储和负载均衡组件。

```terraform
module "ens" {
  source = "alibabacloud-automation/ens/alicloud"

  # 网络配置
  create_network = true
  network_config = {
    network_name  = "example-ens-network"
    description   = "用于边缘计算的ENS网络"
    cidr_block    = "192.168.0.0/16"
    ens_region_id = "cn-chenzhou-telecom_unicom_cmcc"
  }

  # 交换机配置
  create_vswitch = true
  vswitch_configs = {
    "main" = {
      vswitch_name  = "example-ens-vswitch"
      description   = "主ENS交换机"
      cidr_block    = "192.168.1.0/24"
      ens_region_id = "cn-chenzhou-telecom_unicom_cmcc"
    }
  }

  # 安全组配置
  create_security_group = true
  security_group_config = {
    security_group_name = "example-ens-sg"
    description         = "ENS安全组"
  }

  # 实例配置
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

## 示例

* [完整示例](https://github.com/alibabacloud-automation/terraform-alicloud-ens/tree/main/examples/complete)

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->

## 提交问题

如果您在使用此模块时遇到任何问题，请提交一个 [provider issue](https://github.com/aliyun/terraform-provider-alicloud/issues/new) 并告知我们。

**注意：** 不建议在此仓库中提交问题。

## 作者

由阿里云 Terraform 团队创建和维护(terraform@alibabacloud.com)。

## 许可证

MIT 许可。有关完整详细信息，请参阅 LICENSE。

## 参考

* [Terraform-Provider-Alicloud Github](https://github.com/aliyun/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://registry.terraform.io/providers/aliyun/alicloud/latest/docs)