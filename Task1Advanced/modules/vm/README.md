# Terraform VM Module

Универсальный модуль для создания виртуальной машины с дополнительным диском в Yandex Cloud (адаптируется под любого провайдера).

## Параметры

| Переменная               | Описание                                       | Тип      | По умолчанию                     |
|--------------------------|-----------------------------------------------|----------|----------------------------------|
| `vm_name`                | Имя ВМ                                        | string   | —                                |
| `cpu_cores`              | Количество vCPU                               | number   | 2                                |
| `ram_gb`                 | Объём RAM (ГБ)                                | number   | 4                                |
| `subnet_id`              | ID подсети                                    | string   | —                                |
| `ssh_public_key`         | Публичный SSH-ключ                            | string   | —                                |
| `vm_name`                | Имя ВМ                                        | string   | —                                |
| `boot_disk_image_id`     | ID образа                                     | string   | Ubuntu 22.04                     |
| `boot_disk_size_gb`      | Размер загрузочного диска                     | number   | 20                               |
| `additional_disk_size_gb`| Размер доп. диска (0 = не создавать)          | number   | 0                                |
| `enable_nat`             | Назначить публичный IP                        | bool     | true                             |

## Выходные переменные

- `vm_id` – ID ВМ
- `vm_name` – Имя ВМ
- `internal_ip` – Внутренний IP
- `external_ip` – Внешний IP (если есть)
- `boot_disk_id` – ID загрузочного диска
- `additional_disk_id` – ID доп. диска

## Использование

```hcl
module "my_vm" {
  source           = "../../modules/vm"
  vm_name          = "dev-web-server"
  cpu_cores        = 2
  ram_gb           = 4
  subnet_id        = "e9bs3s8h0k7u4t9v1n6f"
  ssh_public_key   = file("~/.ssh/id_rsa.pub")
}