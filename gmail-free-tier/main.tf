terraform {
  backend gcs {
    bucket = "terraform-gcs-state"
    prefix = "terraform/gmail_free_tier"
  }
}

# terraform {
#   backend "remote" {
#     hostname = "app.terraform.io"
#     organization = "HashicorpTEst"
#     workspaces {
#       name = "Demo"
      
#     }
#   }
# }

module "gke_cluster" {
  source = "../modules/gke_cluster"
  gcp-project = "${var.project}"
  gcp-region = "europe-west1"
  gcp-zone = "europe-west1-c"
  num-nodes = "${var.numnodes}"
  template_name = "cjd"
  machine_type = "n1-standard-2"
  packer-image ="${var.image}"
}
