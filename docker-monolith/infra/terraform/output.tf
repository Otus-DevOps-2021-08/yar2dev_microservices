resource "local_file" "AnsibleInventory" {
content = templatefile("./inventory.tpl",
  {  docker = yandex_compute_instance.docker.*.name,  external-ip = yandex_compute_instance.docker.*.network_interface.0.nat_ip_address
  }
 )
  filename = "../ansible/inventory"
}
