variable "web_subnet_name" {
  description = "This is my subnet name"
  default     = "rg_web_subnet"
  type        = string
}

variable "web_subnet_address_space" {
  description = "This is web subnet address space"
  default     = ["10.0.1.1/24"]
  type        = list(string)
}