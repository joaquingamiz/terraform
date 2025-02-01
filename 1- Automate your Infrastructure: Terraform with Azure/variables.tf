variable "subscription_id" {
  description = "Id de la suscripción de Azure"
  type        = string
  default     = ""
}
variable "resource_group_name" {
  description = "Nombre del grupo de recursos"
  type        = string
  default     = "testjg-rg"
}

variable "location" {
  description = "Ubicación de la máquina virtual"
  type        = string
  default     = "West Europe"
}

variable "admin_password" {
  description = "Contraseña del usuario administrador de la VM"
  type        = string
  default     = ""
  /*sensitive   = true */ 
}

variable "vm_size" {
  description = "Tamaño de la máquina virtual"
  type        = string
  default     = "Standard_B2s"
}

variable "subnet_address_prefix" {
  description = "Prefijo de direcciones de la subred"
  type        = string
  default     = "10.0.1.0/24"
}
