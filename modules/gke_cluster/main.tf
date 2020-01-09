resource "google_container_cluster" "cb-core" {
  name     = "cbcore-terraform"
  location = "${var.gcp-zone}"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }
}

resource "google_container_node_pool" "primary_nodepool" {
  name       = "master-pool"
  location   = "${var.gcp-zone}"
  cluster    = "${google_container_cluster.cb-core.name}"
  initial_node_count = "${var.num-nodes}"

  node_config {
    # preemptible  = true
    machine_type = "n1-standard-2"
    # disk_type = "pd-ssd"

    metadata = {
      disable-legacy-endpoints = "true"
    }
    # Check the Oauth scopes aliases at https://cloud.google.com/sdk/gcloud/reference/compute/instances/create 
    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.full_control",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/trace.append"
    ]
  }

  autoscaling {
      min_node_count = 3
      max_node_count = 6
  }
}


# Let's create the CLient Masters machines. For that we are creating a instance template to create as many masters as we want

data "google_compute_image" "jenkins_image" {
  # Adding an If-Else statement to gather data depending on packer image creation first
  count = "${var.packer-image}" ? 1 : 0
  family = "${var.image-family}"
  project = "${var.gcp-project}"
}

resource "google_compute_instance_template" "instance_template" {
  # Adding an If-Else statement to create depending on packer image creation first
  count = "${var.packer-image}" ? 1 : 0
  name = "${var.template_name}"
  project = "${var.gcp-project}"
  region = "${var.gcp-region}"
  
  machine_type = "${var.machine_type}"

  disk {
    source_image = "${data.google_compute_image.jenkins_image[count.index].self_link}"
  }
  network_interface {
    network = "default"
  }
  
}

resource "google_compute_instance_from_template" "jenkins_vm" {
  # Adding an If-Else statement to create depending on packer image creation first
  count = "${var.packer-image}" ? 1 : 0
  name = "jenkins-from-template"
  zone = "${var.gcp-zone}"

  source_instance_template = "${google_compute_instance_template.instance_template[0].self_link}"

  labels = {
    demo = "dcanadillas"
  }
}
