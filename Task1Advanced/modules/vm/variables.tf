variable "vm_name" {
  description = "Имя виртуальной машины"
  type        = string
}

variable "cpu_cores" {
  description = "Количество vCPU"
  type        = number
  default     = 2
}

variable "ram_gb" {
  description = "Объём оперативной памяти (ГБ)"
  type        = number
  default     = 4
}

variable "core_fraction" {
  description = "Гарантированная доля vCPU (для Yandex.Cloud)"
  type        = number
  default     = 20
}

variable "platform_id" {
  description = "Платформа ВМ (standard-v2, standard-v3 и т.д.)"
  type        = string
  default     = "standard-v3"
}

variable "boot_disk_image_id" {
  description = "ID образа загрузочного диска"
  type        = string
  # Например, образ Ubuntu 22.04 LTS
  default     = "fd8fte6bebi857ortlja" # Yandex Cloud Ubuntu 22.04
}

variable "boot_disk_size_gb" {
  description = "Размер загрузочного диска (ГБ)"
  type        = number
  default     = 20
}

variable "boot_disk_type" {
  description = "Тип загрузочного диска (network-ssd, network-hdd)"
  type        = string
  default     = "network-ssd"
}

variable "additional_disk_size_gb" {
  description = "Размер дополнительного диска (ГБ). 0 — не создавать"
  type        = number
  default     = 0
}

variable "additional_disk_type" {
  description = "Тип дополнительного диска"
  type        = string
  default     = "network-ssd"
}

variable "subnet_id" {
  description = "Идентификатор подсети, к которой подключается ВМ"
  type        = string
}

variable "zone" {
  description = "Зона доступности"
  type        = string
  default     = "ru-central1-a"
}

variable "ssh_user" {
  description = "Имя пользователя для SSH-подключения"
  type        = string
  default     = "ubuntu"
}

variable "ssh_public_key" {
  description = "Публичный SSH-ключ"
  type        = string
}

variable "enable_nat" {
  description = "Назначить ли публичный IP (NAT)"
  type        = bool
  default     = true
}