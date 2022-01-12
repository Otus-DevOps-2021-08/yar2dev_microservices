provider "yandex" {

  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}


data "yandex_compute_image" "image" {
  family = "ubuntu-1804-lts"
}


resource "yandex_compute_instance" "k8s-master" {

  name = "${var.master_name}"

  zone = var.zone_app
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }


  resources {
    cores  = 4
    memory = 4

  }



  boot_disk {
    initialize_params {
      size     = 20
      type     = "network-ssd"
      image_id = data.yandex_compute_image.image.id
    }
  }

  network_interface {

    subnet_id = var.subnet_id
    nat       = true
  }

  #waiting for machine start
  provisioner "remote-exec" {
    inline = [
    "echo"]
  }


  connection {
    type        = "ssh"
    host        = self.network_interface[0].nat_ip_address
    user        = "ubuntu"
    agent       = false
    private_key = file(var.private_key_path)
  }


  # provisioner "local-exec" {
  #   command     = "ansible-playbook playbooks/site.yml"
  #   working_dir = "../ansible"
  # }

}

resource "yandex_compute_instance" "k8s-worker" {

  count = var.worker_count
  name  = "${var.worker_name}${count.index}"

  zone = var.zone_app
  metadata = {
    ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  resources {
    cores  = 4
    memory = 4

  }



  boot_disk {
    initialize_params {
      size     = 40
      type     = "network-ssd"
      image_id = data.yandex_compute_image.image.id
    }
  }

  network_interface {

    subnet_id = var.subnet_id
    nat       = true
  }

  #waiting for machine start
  provisioner "remote-exec" {
    inline = [
    "echo"]
  }


  connection {
    type        = "ssh"
    host        = self.network_interface[0].nat_ip_address
    user        = "ubuntu"
    agent       = false
    private_key = file(var.private_key_path)
  }


  # provisioner "local-exec" {
  #   command     = "ansible-playbook playbooks/site.yml"
  #   working_dir = "../ansible"
  # }

}


resource "null_resource" "ansible" {
  provisioner "local-exec" {
    command     = "ansible-playbook playbooks/site.yml"
     working_dir = "../ansible"
     }
  depends_on = [local_file.AnsibleInventory]
}
