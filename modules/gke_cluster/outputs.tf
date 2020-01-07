data "google_container_cluster" "gke_cluster" {
    name = "${google_container_cluster.cb-core.name}"
    location = "${google_container_cluster.cb-core.location}"
}
output "cluster_name" {
  value = "${data.google_container_cluster.gke_cluster.name}"
}
output "cluster_endpoint" {
  value = "${data.google_container_cluster.gke_cluster.endpoint}"
}
