

resource "google_compute_instance_template" "nginx-template" {
  name        = "nginx-template"
  description = "This template is used to create nginx instances."

  instance_description = "nginx-instances"
  machine_type         = "e2-micro"
  can_ip_forward       = false

  scheduling {
    automatic_restart   = true
    on_host_maintenance = "MIGRATE"
  }

  disk {
    source_image      = "debian-cloud/debian-11"
    auto_delete       = true
    boot              = true
  }

  network_interface {
    network = "default"
  }



}