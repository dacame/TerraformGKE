# Let's define output variables from the module outputs. 
output "cluster_name" {
  value = "${module.gke_cluster.cluster_name}"
}
output "endpoint" {
  value = "${module.gke_cluster.cluster_endpoint}"
}


