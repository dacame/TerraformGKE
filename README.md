# Hashicorp Terraform GKE and Instance Template example

In this repo we are using Terraform to create a GKE cluster and an Instance Template in GCP to create our Compute Engine VMs. This Terraform project is based on the following concepts:

* We are using Terraform modules to show IaC reusable capabilities
* Selecting two different environments that uses the same module based on different parameters
* Building machine image using [Packer](https://www.packer.io) to be used in an Instance Template creation
* Using [Terraform backend](https://www.terraform.io/docs/backends/index.html) to persist `.tfstate` in a Cloud storage (GCS in this case)
* Showing some `if-else` statement and basic `loop` capabilities in Terraform HCL language

## Requirements

Following tools/platforms are required in order to work with this demo repo:

* Terraform CLI ([download](https://www.terraform.io/downloads.html))
* Packer ([download](https://www.packer.io/downloads.html))
* Google Cloud ([Free tier subscription is available](https://cloud.google.com/free/))
  
## Structure of the repo

* `cloudbees` folder contains a Terraform project to be used with specific credentials and parameters definition to provision infrastructure using a Google Cloud account
* `gmail-free-tier` folder contains a different Terraform configuration definition to use a Google Free Tier account
* `Packer` folder contains the Packer building image definition to be used by Terraform configurations
* `modules/gke_cluster` folder contains the module to be shared between both configurations to create resources

## Jenkins automation

It is included a Jenkins file template in `Jenkinsfile.template` to use a Jenkins master to automate the Terraform script execution. I recommend to use [CloudBees Jenkins Distribution](https://www.cloudbees.com/products/cloudbees-jenkins-distribution/overview) as a stable free Jenkins distribution

> **NOTE:** Please, bear in mind that this Jenkins pipeline is parametrized to be using credentials managed in Jenkins, so some Jenkins configuration needs to be done in order to make it work.