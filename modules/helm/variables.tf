variable "name" {
  description = "The deployment name"
  default     = "dev"
}

variable "repository" {
  description = "The helm repository"
  default     = "dev"
}

variable "chart" {
  description = "The helm chart"
  default     = "dev"
}

variable "chart_version" {
  description = "The helm chart version"
  default     = "dev"
}

variable "k8s_host" {
  description = "The hostport of the kubernetres API server"
  default     = "dev"
}

variable "k8s_cluster_name" {
  description = "The name of the EKS cluster to connect to"
}

variable "k8s_cluster_ca_cert" {
  description = "The ca certificate used trusted by the API server"
  default     = "dev"
}
