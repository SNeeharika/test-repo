provider "google" {
  version = "3.5.0"
  #credentials = file("/downloads/compute-instance.json")
  project = var.project
  region  = "us-central1"
  zone    = "us-central1-c"
}

resource "google_compute_network" "vpc_network" {
  name = var.network_name
}
resource "google_compute_instance" "vm_instance" {
  name         = "terraform-instance2"
  machine_type = var.machine_type
  zone         = "us-central1-c"
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-7"
    }
  }

  network_interface {
    network = google_compute_network.vpc_network.name
    access_config {
    }
  }
}
