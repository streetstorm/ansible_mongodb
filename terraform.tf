provider "yandex" {
  service_account_key_file  = "/home/storm/devops1/key.json"
  folder_id                = "b1g4e9a7deqo735hb6ut"
  zone                     = "ru-central1-c"
}

resource "yandex_compute_instance" "vm-1"{
  name = "mongodb0"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8vmcue7aajpmeo39kk"
    }
  }

  network_interface {
    subnet_id = "b0cnqcm3blgboojfa5ic"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/sshnopass.pub")}"
  }
}

resource "yandex_compute_instance" "vm-2"{
  name = "mongodb1"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8vmcue7aajpmeo39kk"
    }
  }

  network_interface {
    subnet_id = "b0cnqcm3blgboojfa5ic"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/sshnopass.pub")}"
  }
}

resource "yandex_compute_instance" "vm-3"{
  name = "mongodb2"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd8vmcue7aajpmeo39kk"
    }
  }

  network_interface {
    subnet_id = "b0cnqcm3blgboojfa5ic"
    nat       = true
  }

  metadata = {
    ssh-keys = "ubuntu:${file("~/.ssh/sshnopass.pub")}"
  }
}

output "external_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_3" {
  value = yandex_compute_instance.vm-3.network_interface.0.nat_ip_address
}
