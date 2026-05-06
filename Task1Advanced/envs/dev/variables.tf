variable "vm_name" {
  description = "VM name"
  type        = string
}

variable "cpu_cores" {
  description = "Number of vCPUs"
  type        = number
}

variable "ram_gb" {
  description = "RAM in GB"
  type        = number
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH public key"
  type        = string
}

variable "zone" {
  description = "Availability zone"
  type        = string
}

variable "additional_disk_size_gb" {
  description = "Additional disk size in GB"
  type        = number
  default     = 0
}