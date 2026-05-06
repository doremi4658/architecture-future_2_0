variable "network_name" {
  description = "Имя облачной сети"
  type        = string
  default     = "my-network"
}

variable "subnet_name" {
  description = "Имя подсети"
  type        = string
  default     = "my-subnet"
}

variable "zone" {
  description = "Зона доступности"
  type        = string
  default     = "ru-central1-a"
}

variable "subnet_cidr" {
  description = "CIDR подсети"
  type        = string
  default     = "10.1.0.0/24"
}