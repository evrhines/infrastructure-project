output "host" {
    value = data.aws_eks_cluster.eks.endpoint
}

output "cluster_ca_cert" {
    value = base64decode(data.aws_eks_cluster.eks.certificate_authority[0].data)
}

output "token" {
    value = data.aws_eks_cluster_auth.eks.token
    sensitive = true
}