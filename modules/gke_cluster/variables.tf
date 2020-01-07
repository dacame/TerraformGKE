variable "gcp-project" {
    description = "The Google Cloud Platform project to deploy resources"
}
variable "num-nodes" {
    description = "Number of nodes for the pool to use in the GKE cluster"
    default = 3
}
variable "template_name" {
    description = "The image template to be used for creating the vm"
}
variable "gcp-region" {
    description = "Let's specify a region to use in GCP"
}
variable "gcp-zone" {
    description = "And use a zone within a GCP region"
}
variable "machine_type" {
    description = "THe machine type for the vm"
  
}
variable "image-family" {
    description = "Family name for the image to be created"
    default = "cloudbees"
}
variable "packer-image" {
    description = "This is a boolean variable to decide if creating an instance template depending on a Packer image creation"
    default = true
}

