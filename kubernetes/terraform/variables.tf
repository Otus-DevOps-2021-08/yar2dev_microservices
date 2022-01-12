variable cloud_id {
  description = "Cloud"
}
variable folder_id {
  description = "Folder"
}
variable zone {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable public_key_path {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}

variable subnet_id {
  description = "Subnet"
}
variable service_account_key_file {
  description = "key.json"
}
variable private_key_path {
  description = "ubuntu private key"
}
variable zone_app {
  description = "Zone app"
  default     = "ru-central1-a"
}

variable "worker_name" {

  default = "worker"
}

variable "master_name" {

  default = "worker"
}

variable "worker_count" {
  default = "2"
}
