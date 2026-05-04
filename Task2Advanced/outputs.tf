output "network_id" {
  description = "ID созданной сети"
  value       = yandex_vpc_network.this.id
}

output "subnet_id" {
  description = "ID подсети"
  value       = yandex_vpc_subnet.this.id
}