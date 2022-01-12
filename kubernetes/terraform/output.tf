resource "local_file" "AnsibleInventory" {
  content = templatefile("./inventory.tpl",
    {
      master-external-ip = yandex_compute_instance.k8s-master.*.network_interface.0.nat_ip_address,
      worker-external-ip = yandex_compute_instance.k8s-worker.*.network_interface.0.nat_ip_address
    }


  )
  filename = "../ansible/inventory"
}
