variable "vnetname_1" {
    description = "This is 1st Vnet Name"
    default = "rg-vnet-1"
    type = string
  
}
variable "vnetaddress_space_1" {
    description = "This is 1st vnet address space"
    default = ["10.0.1.0/24"]
    type = list(string)
  
}

variable "vnetname_2" {
    description = "This is 2nd Vnet Name"
    default = "rg-vnet-2"
    type = string
  
}
variable "vnetaddress_space_2" {
    description = "This is 2nd vnet address space"
    default = ["10.0.2.0/24"]
    type = list(string)
  
}