resource "helm_release" "generic_helm" {
  name       = var.name
  repository = var.repository
  chart      = var.chart
  version    = var.version

  values = [
    "${file("values.yaml")}"
  ]
}