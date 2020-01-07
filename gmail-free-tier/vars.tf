variable "credentials" {
    description = "Specifying GCP credentials JSON key"
    default = "~/dcanadillas-main-gmail-20200107.json"
}
variable "numnodes" {
    description = "Number of nodes of GKE node pool"
}
variable "project" {
  description = "GCP project definition. A variable to be set when executing Terraform CLI"
}
variable "gcp-region" {
    description = "Let's specify a region to use in GCP"
}
variable "gcp-zone" {
    description = "And use a zone within a GCP region"
}
variable "image" {
  description = "True if using Instance Template image or False if not"
  default = true
}

