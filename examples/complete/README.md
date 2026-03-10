# ENS Complete Example

This example demonstrates how to use the ENS Terraform module to create a complete Edge Node Service (ENS) infrastructure.

## Features

This example creates:

- ENS Network with custom CIDR block (or uses existing network)
- ENS VSwitch for instance connectivity
- ENS Security Group for network security
- ENS Instance running CentOS
- Optional ENS EIP for public internet access
- Optional ENS Load Balancer for traffic distribution

## Important Notes

### Network Quota Limitation

ENS accounts have a quota limit for networks. If you encounter a `Network.QuotaExceeded` error, you have two options:

1. **Use an existing network** (Recommended):
   - Set `create_network = false`
   - Provide an existing network ID via `existing_network_id` variable
   - See `terraform.tfvars.example` for configuration example

2. **Request quota increase**: Contact Alibaba Cloud support to increase your ENS network quota

### Default Configuration

By default, this example is configured to use an existing network (`create_network = false`) to avoid quota issues. Make sure to provide a valid `existing_network_id` in your `terraform.tfvars` file.

## Usage

To run this example:

1. Clone this repository
2. Navigate to this example directory:
   ```bash
   cd examples/complete
   ```
3. Initialize Terraform:
   ```bash
   terraform init
   ```
4. Copy and configure variables:
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   ```
   Edit `terraform.tfvars` and provide your existing network ID:
   ```hcl
   existing_network_id = "n-xxxxx"  # Replace with your network ID
   create_network      = false
   ```
   Or set `create_network = true` if you have available quota.
5. Plan the deployment:
   ```bash
   terraform plan
   ```
6. Apply the configuration:
   ```bash
   terraform apply
   ```

## Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| ens_region_id | The ENS region ID where resources will be created | string | "cn-chenzhou-telecom_unicom_cmcc" | no |
| example_name | Name prefix for all resources in this example | string | "ens-example" | no |
| instance_type | The ENS instance type | string | "ens.sn1.stiny" | no |
| image_id | The ENS image ID for instances | string | "centos_6_08_64_20G_alibase_20171208" | no |
| instance_password | The password for ENS instances | string | "Example123456!" | no |
| create_eip | Whether to create and attach EIP to instances | bool | false | no |
| create_network | Whether to create a new ENS network | bool | false | no |
| existing_network_id | ID of existing ENS network (required when create_network=false) | string | null | conditional |

## Outputs

| Name | Description |
|------|-------------|
| network_id | The ID of the created ENS network |
| vswitch_ids | The IDs of the created ENS vswitches |
| security_group_id | The ID of the created ENS security group |
| instance_ids | The IDs of the created ENS instances |
| eip_ids | The IDs of the created ENS EIPs |
| load_balancer_id | The ID of the created ENS load balancer |

## Notes

- Make sure you have the necessary permissions to create ENS resources
- ENS resources are region-specific, ensure you specify the correct `ens_region_id`
- The default instance password meets Alibaba Cloud password requirements
- **Important**: If you encounter `Network.QuotaExceeded` error, use an existing network by setting `create_network = false` and providing `existing_network_id`
- This example requires manual configuration via `terraform.tfvars` to provide network information
- EIP and Load Balancer creation is optional and controlled by variables
- ENS is designed for edge computing scenarios with lower latency

## Clean up

To destroy the resources created by this example:

```bash
terraform destroy
```