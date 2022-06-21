variable "vnet_name" {
  description = "This is virtual network name"
  default     = "vnet-default"
  type        = string
}

variable "vnet_address_space" {
  description = "This is vnet address space"
  default     = ["10.0.1.0/16"]
  type        = list(string)

}