module "instance_templates" {
    source = "../InstanceTemplates"
}

provider "google" {
  project = "test1-gcp-project"
  region = "europe-west3"
  credentials = file(var.sa_path)
}
# resource "google_service_account" "default" {
#   account_id   = "git-connection"
#   display_name = "git_connection"
  
# }

# variable "template" {
#   type = string
#   default = "data.google_compute_instance_template.nginx_template"
# }

resource "google_compute_instance_group_manager" "nginx" {
  name     = "nginx-instancegroup"
  base_instance_name = "nginx"
  zone               = "europe-west3-a"

  target_size = 2

  version {
    name              = "nginx"
    instance_template = "${module.instance_templates.template_name.self_link}"
  }

}