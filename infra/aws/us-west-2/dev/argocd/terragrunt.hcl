# ---------------------------------------------------------------------------------------------------------------------
# TERRAGRUNT CONFIGURATION
# This is the configuration for Terragrunt, a thin wrapper for Terraform that helps keep your code DRY and
# maintainable: https://github.com/gruntwork-io/terragrunt
# ---------------------------------------------------------------------------------------------------------------------
# We override the terraform block source attribute here just for the QA environment to show how you would deploy a
# different version of the module in a specific environment.

locals {
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))

  # Automatically load region-level variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  # Automatically load environment-level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))
}

terraform {
  source = "../../../../../modules/helm"
}

# ---------------------------------------------------------------------------------------------------------------------
# Include configurations that are common used across multiple environments.
# ---------------------------------------------------------------------------------------------------------------------

# Include the root `terragrunt.hcl` configuration. The root configuration contains settings that are common across all
# components and environments, such as how to configure remote state.
include "root" {
  path = find_in_parent_folders()
}

dependency "eks" {
  config_path = "../eks"
}

# ---------------------------------------------------------------------------------------------------------------------
# We don't need to override any of the common parameters for this environment, so we don't specify any inputs.
# ---------------------------------------------------------------------------------------------------------------------
inputs = {
  name             = "argocd"
  repository               = "https://charts.bitnami.com/bitnami"
  chart              = "argo-cd"
  chart_version          = "2.2.1"
  k8s_cluster_name = dependency.eks.outputs.cluster_name
  k8s_host = dependency.eks.outputs.host
  k8s_cluster_ca_cert = dependency.eks.outputs.cluster_ca_cert
}