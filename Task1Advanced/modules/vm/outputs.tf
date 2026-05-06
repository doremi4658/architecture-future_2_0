output "vm_id" {
  description = "Идентификатор виртуальной машины"
  value       = yandex_compute_instance.vm.id
}

output "vm_name" {
  description = "Имя виртуальной машины"
  value       = yandex_compute_instance.vm.name
}

output "internal_ip" {
  description = "Внутренний IP-адрес ВМ"
  value       = yandex_compute_instance.vm.network_interface.0.ip_address
}

output "external_ip" {
  description = "Внешний IP-адрес (если NAT включён)"
  value       = var.enable_nat ? yandex_compute_instance.vm.network_interface.0.nat_ip_address : null
}

output "boot_disk_id" {
  description = "ID загрузочного диска"
  value       = yandex_compute_instance.vm.boot_disk.0.disk_id
}

output "additional_disk_id" {
  description = "ID дополнительного диска (если создавался)"
  value       = try(yandex_compute_disk.additional_disk[0].id, null)
}