data "yandex_compute_image" "ubuntu" {
  family = "ubuntu-2204-lts"
}

resource "yandex_vpc_network" "future2_vpc" {
  name = var.network_name
  folder_id = var.yc_folder_id
}

resource "yandex_vpc_subnet" "future2_subnet" {
  name           = var.subnet_name
  zone           = var.yc_zone
  network_id     = yandex_vpc_network.future2_vpc.id
  v4_cidr_blocks = var.subnet_cidr
  folder_id      = var.yc_folder_id
}

resource "yandex_compute_disk" "future2_boot_disk" {
  name = "${var.vm_name}-disk"
  type = "network-ssd"
  zone = var.yc_zone
  image_id = data.yandex_compute_image.ubuntu.image_id
  size = var.vm_disk_size_gb
}

resource "yandex_compute_instance" "future2_instance" {
  name = var.vm_name        
  zone = var.yc_zone

  resources {
    cores  = var.vm_cores
    memory = var.vm_memory
  }

  boot_disk {
    disk_id = yandex_compute_disk.future2_boot_disk.id 
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.future2_subnet.id
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu-user:${file("${var.ssh_public_key_path}")}"
  }
}