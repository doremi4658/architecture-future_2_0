# Ресурс виртуальной машины Yandex Cloud

resource "yandex_compute_instance" "vm" {
  name        = var.vm_name
  platform_id = var.platform_id
  zone        = var.zone

  resources {
    cores         = var.cpu_cores
    memory        = var.ram_gb
    core_fraction = var.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = var.boot_disk_image_id
      size     = var.boot_disk_size_gb
      type     = var.boot_disk_type
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.enable_nat
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${var.ssh_public_key}"
  }
}

# Подключаемый дополнительный диск
resource "yandex_compute_disk" "additional_disk" {
  count = var.additional_disk_size_gb > 0 ? 1 : 0

  name       = "${var.vm_name}-data-disk"
  size       = var.additional_disk_size_gb
  type       = var.additional_disk_type
  zone       = var.zone
}

resource "yandex_compute_instance_disk" "attach_additional" {
  count = var.additional_disk_size_gb > 0 ? 1 : 0

  instance_id = yandex_compute_instance.vm.id
  disk_id     = yandex_compute_disk.additional_disk[0].id
}