resource "local_file" "AnsibleInventory" {
  content = templatefile("./inventory.tpl",
    { external-ip = yandex_compute_instance.gitlab.network_interface.0.nat_ip_address }

  )
  filename = "../ansible/inventory"
}
output "gitlab" {
  value = yandex_compute_instance.gitlab.network_interface.0.nat_ip_address
}
