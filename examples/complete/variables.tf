variable "ens_region_id" {
  description = "The ENS region ID where resources will be created"
  type        = string
  default     = "cn-chenzhou-telecom_unicom_cmcc"
}

variable "example_name" {
  description = "Name prefix for all resources in this example"
  type        = string
  default     = "ens-example"
}

variable "instance_type" {
  description = "The ENS instance type"
  type        = string
  default     = "ens.sn1.stiny"
}

variable "image_id" {
  description = "The ENS image ID for instances"
  type        = string
  default     = "centos_6_08_64_20G_alibase_20171208"
}

variable "instance_password" {
  description = "The password for ENS instances"
  type        = string
  default     = "Example123456!"
  sensitive   = true
}

variable "create_eip" {
  description = "Whether to create and attach EIP to instances"
  type        = bool
  default     = false
}

variable "create_network" {
  description = "Whether to create a new ENS network. Set to false to use existing network."
  type        = bool
  default     = false
}

variable "existing_network_id" {
  description = "The ID of an existing ENS network. Required when create_network is false."
  type        = string
  default     = null
}