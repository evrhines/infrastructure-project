provider "helm" {
  kubernetes {
    host     = var.k8s_host

    client_certificate     = var.k8s_client_cert
    client_key             = var.k8s_client_key
    cluster_ca_certificate = var.k8s_cluster_ca_cert
  }
}
