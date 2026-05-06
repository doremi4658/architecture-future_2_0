terraform {
  required_version = ">= 1.3"
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.95"
    }
  }
}

provider "yandex" {}

module "prod_vm" {
  source           = "../../modules/vm"
  vm_name          = var.vm_name
  cpu_cores        = var.cpu_cores
  ram_gb           = var.ram_gb
  subnet_id        = var.subnet_id
  ssh_public_key   = var.ssh_public_key
  zone             = var.zone
  additional_disk_size_gb = var.additional_disk_size_gb
}