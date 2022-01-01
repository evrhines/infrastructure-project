locals {
  cluster_name                 = "evrhiness-project.k8s.local"
  master_autoscaling_group_ids = [aws_autoscaling_group.master-us-west-2a-masters-evrhiness-project-k8s-local.id]
  master_security_group_ids    = [aws_security_group.masters-evrhiness-project-k8s-local.id]
  masters_role_arn             = aws_iam_role.masters-evrhiness-project-k8s-local.arn
  masters_role_name            = aws_iam_role.masters-evrhiness-project-k8s-local.name
  node_autoscaling_group_ids   = [aws_autoscaling_group.nodes-us-west-2a-evrhiness-project-k8s-local.id, aws_autoscaling_group.nodes-us-west-2b-evrhiness-project-k8s-local.id, aws_autoscaling_group.nodes-us-west-2c-evrhiness-project-k8s-local.id]
  node_security_group_ids      = [aws_security_group.nodes-evrhiness-project-k8s-local.id]
  node_subnet_ids              = [aws_subnet.us-west-2a-evrhiness-project-k8s-local.id, aws_subnet.us-west-2b-evrhiness-project-k8s-local.id, aws_subnet.us-west-2c-evrhiness-project-k8s-local.id]
  nodes_role_arn               = aws_iam_role.nodes-evrhiness-project-k8s-local.arn
  nodes_role_name              = aws_iam_role.nodes-evrhiness-project-k8s-local.name
  region                       = "us-west-2"
  route_table_public_id        = aws_route_table.evrhiness-project-k8s-local.id
  subnet_us-west-2a_id         = aws_subnet.us-west-2a-evrhiness-project-k8s-local.id
  subnet_us-west-2b_id         = aws_subnet.us-west-2b-evrhiness-project-k8s-local.id
  subnet_us-west-2c_id         = aws_subnet.us-west-2c-evrhiness-project-k8s-local.id
  vpc_cidr_block               = aws_vpc.evrhiness-project-k8s-local.cidr_block
  vpc_id                       = aws_vpc.evrhiness-project-k8s-local.id
}

output "cluster_name" {
  value = "evrhiness-project.k8s.local"
}

output "master_autoscaling_group_ids" {
  value = [aws_autoscaling_group.master-us-west-2a-masters-evrhiness-project-k8s-local.id]
}

output "master_security_group_ids" {
  value = [aws_security_group.masters-evrhiness-project-k8s-local.id]
}

output "masters_role_arn" {
  value = aws_iam_role.masters-evrhiness-project-k8s-local.arn
}

output "masters_role_name" {
  value = aws_iam_role.masters-evrhiness-project-k8s-local.name
}

output "node_autoscaling_group_ids" {
  value = [aws_autoscaling_group.nodes-us-west-2a-evrhiness-project-k8s-local.id, aws_autoscaling_group.nodes-us-west-2b-evrhiness-project-k8s-local.id, aws_autoscaling_group.nodes-us-west-2c-evrhiness-project-k8s-local.id]
}

output "node_security_group_ids" {
  value = [aws_security_group.nodes-evrhiness-project-k8s-local.id]
}

output "node_subnet_ids" {
  value = [aws_subnet.us-west-2a-evrhiness-project-k8s-local.id, aws_subnet.us-west-2b-evrhiness-project-k8s-local.id, aws_subnet.us-west-2c-evrhiness-project-k8s-local.id]
}

output "nodes_role_arn" {
  value = aws_iam_role.nodes-evrhiness-project-k8s-local.arn
}

output "nodes_role_name" {
  value = aws_iam_role.nodes-evrhiness-project-k8s-local.name
}

output "region" {
  value = "us-west-2"
}

output "route_table_public_id" {
  value = aws_route_table.evrhiness-project-k8s-local.id
}

output "subnet_us-west-2a_id" {
  value = aws_subnet.us-west-2a-evrhiness-project-k8s-local.id
}

output "subnet_us-west-2b_id" {
  value = aws_subnet.us-west-2b-evrhiness-project-k8s-local.id
}

output "subnet_us-west-2c_id" {
  value = aws_subnet.us-west-2c-evrhiness-project-k8s-local.id
}

output "vpc_cidr_block" {
  value = aws_vpc.evrhiness-project-k8s-local.cidr_block
}

output "vpc_id" {
  value = aws_vpc.evrhiness-project-k8s-local.id
}

provider "aws" {
  region = "us-west-2"
}

provider "aws" {
  alias  = "files"
  region = "us-west-2"
}

resource "aws_autoscaling_group" "master-us-west-2a-masters-evrhiness-project-k8s-local" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.master-us-west-2a-masters-evrhiness-project-k8s-local.id
    version = aws_launch_template.master-us-west-2a-masters-evrhiness-project-k8s-local.latest_version
  }
  load_balancers        = [aws_elb.api-evrhiness-project-k8s-local.id]
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "master-us-west-2a.masters.evrhiness-project.k8s.local"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "evrhiness-project.k8s.local"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "master-us-west-2a.masters.evrhiness-project.k8s.local"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "master-us-west-2a"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "master"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/master"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "master-us-west-2a"
  }
  tag {
    key                 = "kubernetes.io/cluster/evrhiness-project.k8s.local"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-west-2a-evrhiness-project-k8s-local.id]
}

resource "aws_autoscaling_group" "nodes-us-west-2a-evrhiness-project-k8s-local" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-us-west-2a-evrhiness-project-k8s-local.id
    version = aws_launch_template.nodes-us-west-2a-evrhiness-project-k8s-local.latest_version
  }
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "nodes-us-west-2a.evrhiness-project.k8s.local"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "evrhiness-project.k8s.local"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-us-west-2a.evrhiness-project.k8s.local"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-west-2a"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "node"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-west-2a"
  }
  tag {
    key                 = "kubernetes.io/cluster/evrhiness-project.k8s.local"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-west-2a-evrhiness-project-k8s-local.id]
}

resource "aws_autoscaling_group" "nodes-us-west-2b-evrhiness-project-k8s-local" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-us-west-2b-evrhiness-project-k8s-local.id
    version = aws_launch_template.nodes-us-west-2b-evrhiness-project-k8s-local.latest_version
  }
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "nodes-us-west-2b.evrhiness-project.k8s.local"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "evrhiness-project.k8s.local"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-us-west-2b.evrhiness-project.k8s.local"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-west-2b"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "node"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-west-2b"
  }
  tag {
    key                 = "kubernetes.io/cluster/evrhiness-project.k8s.local"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-west-2b-evrhiness-project-k8s-local.id]
}

resource "aws_autoscaling_group" "nodes-us-west-2c-evrhiness-project-k8s-local" {
  enabled_metrics = ["GroupDesiredCapacity", "GroupInServiceInstances", "GroupMaxSize", "GroupMinSize", "GroupPendingInstances", "GroupStandbyInstances", "GroupTerminatingInstances", "GroupTotalInstances"]
  launch_template {
    id      = aws_launch_template.nodes-us-west-2c-evrhiness-project-k8s-local.id
    version = aws_launch_template.nodes-us-west-2c-evrhiness-project-k8s-local.latest_version
  }
  max_size              = 1
  metrics_granularity   = "1Minute"
  min_size              = 1
  name                  = "nodes-us-west-2c.evrhiness-project.k8s.local"
  protect_from_scale_in = false
  tag {
    key                 = "KubernetesCluster"
    propagate_at_launch = true
    value               = "evrhiness-project.k8s.local"
  }
  tag {
    key                 = "Name"
    propagate_at_launch = true
    value               = "nodes-us-west-2c.evrhiness-project.k8s.local"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-west-2c"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"
    propagate_at_launch = true
    value               = "node"
  }
  tag {
    key                 = "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node"
    propagate_at_launch = true
    value               = ""
  }
  tag {
    key                 = "k8s.io/role/node"
    propagate_at_launch = true
    value               = "1"
  }
  tag {
    key                 = "kops.k8s.io/instancegroup"
    propagate_at_launch = true
    value               = "nodes-us-west-2c"
  }
  tag {
    key                 = "kubernetes.io/cluster/evrhiness-project.k8s.local"
    propagate_at_launch = true
    value               = "owned"
  }
  vpc_zone_identifier = [aws_subnet.us-west-2c-evrhiness-project-k8s-local.id]
}

resource "aws_ebs_volume" "a-etcd-events-evrhiness-project-k8s-local" {
  availability_zone = "us-west-2a"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                                 = "evrhiness-project.k8s.local"
    "Name"                                              = "a.etcd-events.evrhiness-project.k8s.local"
    "k8s.io/etcd/events"                                = "a/a"
    "k8s.io/role/master"                                = "1"
    "kubernetes.io/cluster/evrhiness-project.k8s.local" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_ebs_volume" "a-etcd-main-evrhiness-project-k8s-local" {
  availability_zone = "us-west-2a"
  encrypted         = true
  iops              = 3000
  size              = 20
  tags = {
    "KubernetesCluster"                                 = "evrhiness-project.k8s.local"
    "Name"                                              = "a.etcd-main.evrhiness-project.k8s.local"
    "k8s.io/etcd/main"                                  = "a/a"
    "k8s.io/role/master"                                = "1"
    "kubernetes.io/cluster/evrhiness-project.k8s.local" = "owned"
  }
  throughput = 125
  type       = "gp3"
}

resource "aws_elb" "api-evrhiness-project-k8s-local" {
  cross_zone_load_balancing = false
  health_check {
    healthy_threshold   = 2
    interval            = 10
    target              = "SSL:443"
    timeout             = 5
    unhealthy_threshold = 2
  }
  idle_timeout = 300
  listener {
    instance_port     = 443
    instance_protocol = "TCP"
    lb_port           = 443
    lb_protocol       = "TCP"
  }
  name            = "api-evrhiness-project-k8s-e7odeo"
  security_groups = [aws_security_group.api-elb-evrhiness-project-k8s-local.id]
  subnets         = [aws_subnet.us-west-2a-evrhiness-project-k8s-local.id, aws_subnet.us-west-2b-evrhiness-project-k8s-local.id, aws_subnet.us-west-2c-evrhiness-project-k8s-local.id]
  tags = {
    "KubernetesCluster"                                 = "evrhiness-project.k8s.local"
    "Name"                                              = "api.evrhiness-project.k8s.local"
    "kubernetes.io/cluster/evrhiness-project.k8s.local" = "owned"
  }
}

resource "aws_iam_instance_profile" "masters-evrhiness-project-k8s-local" {
  name = "masters.evrhiness-project.k8s.local"
  role = aws_iam_role.masters-evrhiness-project-k8s-local.name
  tags = {
    "KubernetesCluster"                                 = "evrhiness-project.k8s.local"
    "Name"                                              = "masters.evrhiness-project.k8s.local"
    "kubernetes.io/cluster/evrhiness-project.k8s.local" = "owned"
  }
}

resource "aws_iam_instance_profile" "nodes-evrhiness-project-k8s-local" {
  name = "nodes.evrhiness-project.k8s.local"
  role = aws_iam_role.nodes-evrhiness-project-k8s-local.name
  tags = {
    "KubernetesCluster"                                 = "evrhiness-project.k8s.local"
    "Name"                                              = "nodes.evrhiness-project.k8s.local"
    "kubernetes.io/cluster/evrhiness-project.k8s.local" = "owned"
  }
}

resource "aws_iam_role" "masters-evrhiness-project-k8s-local" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_masters.evrhiness-project.k8s.local_policy")
  name               = "masters.evrhiness-project.k8s.local"
  tags = {
    "KubernetesCluster"                                 = "evrhiness-project.k8s.local"
    "Name"                                              = "masters.evrhiness-project.k8s.local"
    "kubernetes.io/cluster/evrhiness-project.k8s.local" = "owned"
  }
}

resource "aws_iam_role" "nodes-evrhiness-project-k8s-local" {
  assume_role_policy = file("${path.module}/data/aws_iam_role_nodes.evrhiness-project.k8s.local_policy")
  name               = "nodes.evrhiness-project.k8s.local"
  tags = {
    "KubernetesCluster"                                 = "evrhiness-project.k8s.local"
    "Name"                                              = "nodes.evrhiness-project.k8s.local"
    "kubernetes.io/cluster/evrhiness-project.k8s.local" = "owned"
  }
}

resource "aws_iam_role_policy" "masters-evrhiness-project-k8s-local" {
  name   = "masters.evrhiness-project.k8s.local"
  policy = file("${path.module}/data/aws_iam_role_policy_masters.evrhiness-project.k8s.local_policy")
  role   = aws_iam_role.masters-evrhiness-project-k8s-local.name
}

resource "aws_iam_role_policy" "nodes-evrhiness-project-k8s-local" {
  name   = "nodes.evrhiness-project.k8s.local"
  policy = file("${path.module}/data/aws_iam_role_policy_nodes.evrhiness-project.k8s.local_policy")
  role   = aws_iam_role.nodes-evrhiness-project-k8s-local.name
}

resource "aws_internet_gateway" "evrhiness-project-k8s-local" {
  tags = {
    "KubernetesCluster"                                 = "evrhiness-project.k8s.local"
    "Name"                                              = "evrhiness-project.k8s.local"
    "kubernetes.io/cluster/evrhiness-project.k8s.local" = "owned"
  }
  vpc_id = aws_vpc.evrhiness-project-k8s-local.id
}

resource "aws_launch_template" "master-us-west-2a-masters-evrhiness-project-k8s-local" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 64
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.masters-evrhiness-project-k8s-local.id
  }
  image_id      = "ami-0f81e6e71078b75b6"
  instance_type = "t3.medium"
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 3
    http_tokens                 = "required"
  }
  monitoring {
    enabled = false
  }
  name = "master-us-west-2a.masters.evrhiness-project.k8s.local"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.masters-evrhiness-project-k8s-local.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                                                     = "evrhiness-project.k8s.local"
      "Name"                                                                                                  = "master-us-west-2a.masters.evrhiness-project.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"                               = "master-us-west-2a"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "master-us-west-2a"
      "kubernetes.io/cluster/evrhiness-project.k8s.local"                                                     = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                                                     = "evrhiness-project.k8s.local"
      "Name"                                                                                                  = "master-us-west-2a.masters.evrhiness-project.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"                               = "master-us-west-2a"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
      "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
      "k8s.io/role/master"                                                                                    = "1"
      "kops.k8s.io/instancegroup"                                                                             = "master-us-west-2a"
      "kubernetes.io/cluster/evrhiness-project.k8s.local"                                                     = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                                                     = "evrhiness-project.k8s.local"
    "Name"                                                                                                  = "master-us-west-2a.masters.evrhiness-project.k8s.local"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"                               = "master-us-west-2a"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/kops-controller-pki"                         = ""
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"                                      = "master"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/control-plane"                   = ""
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/master"                          = ""
    "k8s.io/cluster-autoscaler/node-template/label/node.kubernetes.io/exclude-from-external-load-balancers" = ""
    "k8s.io/role/master"                                                                                    = "1"
    "kops.k8s.io/instancegroup"                                                                             = "master-us-west-2a"
    "kubernetes.io/cluster/evrhiness-project.k8s.local"                                                     = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_master-us-west-2a.masters.evrhiness-project.k8s.local_user_data")
}

resource "aws_launch_template" "nodes-us-west-2a-evrhiness-project-k8s-local" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-evrhiness-project-k8s-local.id
  }
  image_id      = "ami-0f81e6e71078b75b6"
  instance_type = "t3.medium"
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
  }
  monitoring {
    enabled = false
  }
  name = "nodes-us-west-2a.evrhiness-project.k8s.local"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.nodes-evrhiness-project-k8s-local.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "evrhiness-project.k8s.local"
      "Name"                                                                       = "nodes-us-west-2a.evrhiness-project.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-west-2a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-west-2a"
      "kubernetes.io/cluster/evrhiness-project.k8s.local"                          = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "evrhiness-project.k8s.local"
      "Name"                                                                       = "nodes-us-west-2a.evrhiness-project.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-west-2a"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-west-2a"
      "kubernetes.io/cluster/evrhiness-project.k8s.local"                          = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "evrhiness-project.k8s.local"
    "Name"                                                                       = "nodes-us-west-2a.evrhiness-project.k8s.local"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-west-2a"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-us-west-2a"
    "kubernetes.io/cluster/evrhiness-project.k8s.local"                          = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-us-west-2a.evrhiness-project.k8s.local_user_data")
}

resource "aws_launch_template" "nodes-us-west-2b-evrhiness-project-k8s-local" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-evrhiness-project-k8s-local.id
  }
  image_id      = "ami-0f81e6e71078b75b6"
  instance_type = "t3.medium"
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
  }
  monitoring {
    enabled = false
  }
  name = "nodes-us-west-2b.evrhiness-project.k8s.local"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.nodes-evrhiness-project-k8s-local.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "evrhiness-project.k8s.local"
      "Name"                                                                       = "nodes-us-west-2b.evrhiness-project.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-west-2b"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-west-2b"
      "kubernetes.io/cluster/evrhiness-project.k8s.local"                          = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "evrhiness-project.k8s.local"
      "Name"                                                                       = "nodes-us-west-2b.evrhiness-project.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-west-2b"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-west-2b"
      "kubernetes.io/cluster/evrhiness-project.k8s.local"                          = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "evrhiness-project.k8s.local"
    "Name"                                                                       = "nodes-us-west-2b.evrhiness-project.k8s.local"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-west-2b"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-us-west-2b"
    "kubernetes.io/cluster/evrhiness-project.k8s.local"                          = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-us-west-2b.evrhiness-project.k8s.local_user_data")
}

resource "aws_launch_template" "nodes-us-west-2c-evrhiness-project-k8s-local" {
  block_device_mappings {
    device_name = "/dev/sda1"
    ebs {
      delete_on_termination = true
      encrypted             = true
      iops                  = 3000
      throughput            = 125
      volume_size           = 128
      volume_type           = "gp3"
    }
  }
  iam_instance_profile {
    name = aws_iam_instance_profile.nodes-evrhiness-project-k8s-local.id
  }
  image_id      = "ami-0f81e6e71078b75b6"
  instance_type = "t3.medium"
  lifecycle {
    create_before_destroy = true
  }
  metadata_options {
    http_endpoint               = "enabled"
    http_protocol_ipv6          = "disabled"
    http_put_response_hop_limit = 1
    http_tokens                 = "required"
  }
  monitoring {
    enabled = false
  }
  name = "nodes-us-west-2c.evrhiness-project.k8s.local"
  network_interfaces {
    associate_public_ip_address = true
    delete_on_termination       = true
    ipv6_address_count          = 0
    security_groups             = [aws_security_group.nodes-evrhiness-project-k8s-local.id]
  }
  tag_specifications {
    resource_type = "instance"
    tags = {
      "KubernetesCluster"                                                          = "evrhiness-project.k8s.local"
      "Name"                                                                       = "nodes-us-west-2c.evrhiness-project.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-west-2c"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-west-2c"
      "kubernetes.io/cluster/evrhiness-project.k8s.local"                          = "owned"
    }
  }
  tag_specifications {
    resource_type = "volume"
    tags = {
      "KubernetesCluster"                                                          = "evrhiness-project.k8s.local"
      "Name"                                                                       = "nodes-us-west-2c.evrhiness-project.k8s.local"
      "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-west-2c"
      "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
      "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
      "k8s.io/role/node"                                                           = "1"
      "kops.k8s.io/instancegroup"                                                  = "nodes-us-west-2c"
      "kubernetes.io/cluster/evrhiness-project.k8s.local"                          = "owned"
    }
  }
  tags = {
    "KubernetesCluster"                                                          = "evrhiness-project.k8s.local"
    "Name"                                                                       = "nodes-us-west-2c.evrhiness-project.k8s.local"
    "k8s.io/cluster-autoscaler/node-template/label/kops.k8s.io/instancegroup"    = "nodes-us-west-2c"
    "k8s.io/cluster-autoscaler/node-template/label/kubernetes.io/role"           = "node"
    "k8s.io/cluster-autoscaler/node-template/label/node-role.kubernetes.io/node" = ""
    "k8s.io/role/node"                                                           = "1"
    "kops.k8s.io/instancegroup"                                                  = "nodes-us-west-2c"
    "kubernetes.io/cluster/evrhiness-project.k8s.local"                          = "owned"
  }
  user_data = filebase64("${path.module}/data/aws_launch_template_nodes-us-west-2c.evrhiness-project.k8s.local_user_data")
}

resource "aws_route" "route-0-0-0-0--0" {
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.evrhiness-project-k8s-local.id
  route_table_id         = aws_route_table.evrhiness-project-k8s-local.id
}

resource "aws_route" "route-__--0" {
  destination_ipv6_cidr_block = "::/0"
  gateway_id                  = aws_internet_gateway.evrhiness-project-k8s-local.id
  route_table_id              = aws_route_table.evrhiness-project-k8s-local.id
}

resource "aws_route_table" "evrhiness-project-k8s-local" {
  tags = {
    "KubernetesCluster"                                 = "evrhiness-project.k8s.local"
    "Name"                                              = "evrhiness-project.k8s.local"
    "kubernetes.io/cluster/evrhiness-project.k8s.local" = "owned"
    "kubernetes.io/kops/role"                           = "public"
  }
  vpc_id = aws_vpc.evrhiness-project-k8s-local.id
}

resource "aws_route_table_association" "us-west-2a-evrhiness-project-k8s-local" {
  route_table_id = aws_route_table.evrhiness-project-k8s-local.id
  subnet_id      = aws_subnet.us-west-2a-evrhiness-project-k8s-local.id
}

resource "aws_route_table_association" "us-west-2b-evrhiness-project-k8s-local" {
  route_table_id = aws_route_table.evrhiness-project-k8s-local.id
  subnet_id      = aws_subnet.us-west-2b-evrhiness-project-k8s-local.id
}

resource "aws_route_table_association" "us-west-2c-evrhiness-project-k8s-local" {
  route_table_id = aws_route_table.evrhiness-project-k8s-local.id
  subnet_id      = aws_subnet.us-west-2c-evrhiness-project-k8s-local.id
}

resource "aws_s3_bucket_object" "cluster-completed-spec" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_cluster-completed.spec_content")
  key      = "evrhiness-project.k8s.local/cluster-completed.spec"
  provider = aws.files
}

resource "aws_s3_bucket_object" "etcd-cluster-spec-events" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_etcd-cluster-spec-events_content")
  key      = "evrhiness-project.k8s.local/backups/etcd/events/control/etcd-cluster-spec"
  provider = aws.files
}

resource "aws_s3_bucket_object" "etcd-cluster-spec-main" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_etcd-cluster-spec-main_content")
  key      = "evrhiness-project.k8s.local/backups/etcd/main/control/etcd-cluster-spec"
  provider = aws.files
}

resource "aws_s3_bucket_object" "evrhiness-project-k8s-local-addons-aws-ebs-csi-driver-addons-k8s-io-k8s-1-17" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_evrhiness-project.k8s.local-addons-aws-ebs-csi-driver.addons.k8s.io-k8s-1.17_content")
  key      = "evrhiness-project.k8s.local/addons/aws-ebs-csi-driver.addons.k8s.io/k8s-1.17.yaml"
  provider = aws.files
}

resource "aws_s3_bucket_object" "evrhiness-project-k8s-local-addons-bootstrap" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_evrhiness-project.k8s.local-addons-bootstrap_content")
  key      = "evrhiness-project.k8s.local/addons/bootstrap-channel.yaml"
  provider = aws.files
}

resource "aws_s3_bucket_object" "evrhiness-project-k8s-local-addons-core-addons-k8s-io" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_evrhiness-project.k8s.local-addons-core.addons.k8s.io_content")
  key      = "evrhiness-project.k8s.local/addons/core.addons.k8s.io/v1.4.0.yaml"
  provider = aws.files
}

resource "aws_s3_bucket_object" "evrhiness-project-k8s-local-addons-coredns-addons-k8s-io-k8s-1-12" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_evrhiness-project.k8s.local-addons-coredns.addons.k8s.io-k8s-1.12_content")
  key      = "evrhiness-project.k8s.local/addons/coredns.addons.k8s.io/k8s-1.12.yaml"
  provider = aws.files
}

resource "aws_s3_bucket_object" "evrhiness-project-k8s-local-addons-dns-controller-addons-k8s-io-k8s-1-12" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_evrhiness-project.k8s.local-addons-dns-controller.addons.k8s.io-k8s-1.12_content")
  key      = "evrhiness-project.k8s.local/addons/dns-controller.addons.k8s.io/k8s-1.12.yaml"
  provider = aws.files
}

resource "aws_s3_bucket_object" "evrhiness-project-k8s-local-addons-kops-controller-addons-k8s-io-k8s-1-16" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_evrhiness-project.k8s.local-addons-kops-controller.addons.k8s.io-k8s-1.16_content")
  key      = "evrhiness-project.k8s.local/addons/kops-controller.addons.k8s.io/k8s-1.16.yaml"
  provider = aws.files
}

resource "aws_s3_bucket_object" "evrhiness-project-k8s-local-addons-kubelet-api-rbac-addons-k8s-io-k8s-1-9" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_evrhiness-project.k8s.local-addons-kubelet-api.rbac.addons.k8s.io-k8s-1.9_content")
  key      = "evrhiness-project.k8s.local/addons/kubelet-api.rbac.addons.k8s.io/k8s-1.9.yaml"
  provider = aws.files
}

resource "aws_s3_bucket_object" "evrhiness-project-k8s-local-addons-limit-range-addons-k8s-io" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_evrhiness-project.k8s.local-addons-limit-range.addons.k8s.io_content")
  key      = "evrhiness-project.k8s.local/addons/limit-range.addons.k8s.io/v1.5.0.yaml"
  provider = aws.files
}

resource "aws_s3_bucket_object" "evrhiness-project-k8s-local-addons-storage-aws-addons-k8s-io-v1-15-0" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_evrhiness-project.k8s.local-addons-storage-aws.addons.k8s.io-v1.15.0_content")
  key      = "evrhiness-project.k8s.local/addons/storage-aws.addons.k8s.io/v1.15.0.yaml"
  provider = aws.files
}

resource "aws_s3_bucket_object" "kops-version-txt" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_kops-version.txt_content")
  key      = "evrhiness-project.k8s.local/kops-version.txt"
  provider = aws.files
}

resource "aws_s3_bucket_object" "manifests-etcdmanager-events" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_manifests-etcdmanager-events_content")
  key      = "evrhiness-project.k8s.local/manifests/etcd/events.yaml"
  provider = aws.files
}

resource "aws_s3_bucket_object" "manifests-etcdmanager-main" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_manifests-etcdmanager-main_content")
  key      = "evrhiness-project.k8s.local/manifests/etcd/main.yaml"
  provider = aws.files
}

resource "aws_s3_bucket_object" "manifests-static-kube-apiserver-healthcheck" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_manifests-static-kube-apiserver-healthcheck_content")
  key      = "evrhiness-project.k8s.local/manifests/static/kube-apiserver-healthcheck.yaml"
  provider = aws.files
}

resource "aws_s3_bucket_object" "nodeupconfig-master-us-west-2a" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_nodeupconfig-master-us-west-2a_content")
  key      = "evrhiness-project.k8s.local/igconfig/master/master-us-west-2a/nodeupconfig.yaml"
  provider = aws.files
}

resource "aws_s3_bucket_object" "nodeupconfig-nodes-us-west-2a" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_nodeupconfig-nodes-us-west-2a_content")
  key      = "evrhiness-project.k8s.local/igconfig/node/nodes-us-west-2a/nodeupconfig.yaml"
  provider = aws.files
}

resource "aws_s3_bucket_object" "nodeupconfig-nodes-us-west-2b" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_nodeupconfig-nodes-us-west-2b_content")
  key      = "evrhiness-project.k8s.local/igconfig/node/nodes-us-west-2b/nodeupconfig.yaml"
  provider = aws.files
}

resource "aws_s3_bucket_object" "nodeupconfig-nodes-us-west-2c" {
  bucket   = "kops-state"
  content  = file("${path.module}/data/aws_s3_bucket_object_nodeupconfig-nodes-us-west-2c_content")
  key      = "evrhiness-project.k8s.local/igconfig/node/nodes-us-west-2c/nodeupconfig.yaml"
  provider = aws.files
}

resource "aws_security_group" "api-elb-evrhiness-project-k8s-local" {
  description = "Security group for api ELB"
  name        = "api-elb.evrhiness-project.k8s.local"
  tags = {
    "KubernetesCluster"                                 = "evrhiness-project.k8s.local"
    "Name"                                              = "api-elb.evrhiness-project.k8s.local"
    "kubernetes.io/cluster/evrhiness-project.k8s.local" = "owned"
  }
  vpc_id = aws_vpc.evrhiness-project-k8s-local.id
}

resource "aws_security_group" "masters-evrhiness-project-k8s-local" {
  description = "Security group for masters"
  name        = "masters.evrhiness-project.k8s.local"
  tags = {
    "KubernetesCluster"                                 = "evrhiness-project.k8s.local"
    "Name"                                              = "masters.evrhiness-project.k8s.local"
    "kubernetes.io/cluster/evrhiness-project.k8s.local" = "owned"
  }
  vpc_id = aws_vpc.evrhiness-project-k8s-local.id
}

resource "aws_security_group" "nodes-evrhiness-project-k8s-local" {
  description = "Security group for nodes"
  name        = "nodes.evrhiness-project.k8s.local"
  tags = {
    "KubernetesCluster"                                 = "evrhiness-project.k8s.local"
    "Name"                                              = "nodes.evrhiness-project.k8s.local"
    "kubernetes.io/cluster/evrhiness-project.k8s.local" = "owned"
  }
  vpc_id = aws_vpc.evrhiness-project-k8s-local.id
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-masters-evrhiness-project-k8s-local" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-evrhiness-project-k8s-local.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-22to22-nodes-evrhiness-project-k8s-local" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 22
  protocol          = "tcp"
  security_group_id = aws_security_group.nodes-evrhiness-project-k8s-local.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-0-0-0-0--0-ingress-tcp-443to443-api-elb-evrhiness-project-k8s-local" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.api-elb-evrhiness-project-k8s-local.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "from-__--0-ingress-tcp-22to22-masters-evrhiness-project-k8s-local" {
  from_port         = 22
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "tcp"
  security_group_id = aws_security_group.masters-evrhiness-project-k8s-local.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-__--0-ingress-tcp-22to22-nodes-evrhiness-project-k8s-local" {
  from_port         = 22
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "tcp"
  security_group_id = aws_security_group.nodes-evrhiness-project-k8s-local.id
  to_port           = 22
  type              = "ingress"
}

resource "aws_security_group_rule" "from-__--0-ingress-tcp-443to443-api-elb-evrhiness-project-k8s-local" {
  from_port         = 443
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "tcp"
  security_group_id = aws_security_group.api-elb-evrhiness-project-k8s-local.id
  to_port           = 443
  type              = "ingress"
}

resource "aws_security_group_rule" "from-api-elb-evrhiness-project-k8s-local-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.api-elb-evrhiness-project-k8s-local.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-api-elb-evrhiness-project-k8s-local-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.api-elb-evrhiness-project-k8s-local.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-evrhiness-project-k8s-local-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.masters-evrhiness-project-k8s-local.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-evrhiness-project-k8s-local-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.masters-evrhiness-project-k8s-local.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-masters-evrhiness-project-k8s-local-ingress-all-0to0-masters-evrhiness-project-k8s-local" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.masters-evrhiness-project-k8s-local.id
  source_security_group_id = aws_security_group.masters-evrhiness-project-k8s-local.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-masters-evrhiness-project-k8s-local-ingress-all-0to0-nodes-evrhiness-project-k8s-local" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-evrhiness-project-k8s-local.id
  source_security_group_id = aws_security_group.masters-evrhiness-project-k8s-local.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-evrhiness-project-k8s-local-egress-all-0to0-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 0
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-evrhiness-project-k8s-local.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-nodes-evrhiness-project-k8s-local-egress-all-0to0-__--0" {
  from_port         = 0
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "-1"
  security_group_id = aws_security_group.nodes-evrhiness-project-k8s-local.id
  to_port           = 0
  type              = "egress"
}

resource "aws_security_group_rule" "from-nodes-evrhiness-project-k8s-local-ingress-all-0to0-nodes-evrhiness-project-k8s-local" {
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = aws_security_group.nodes-evrhiness-project-k8s-local.id
  source_security_group_id = aws_security_group.nodes-evrhiness-project-k8s-local.id
  to_port                  = 0
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-evrhiness-project-k8s-local-ingress-tcp-1to2379-masters-evrhiness-project-k8s-local" {
  from_port                = 1
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-evrhiness-project-k8s-local.id
  source_security_group_id = aws_security_group.nodes-evrhiness-project-k8s-local.id
  to_port                  = 2379
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-evrhiness-project-k8s-local-ingress-tcp-2382to4000-masters-evrhiness-project-k8s-local" {
  from_port                = 2382
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-evrhiness-project-k8s-local.id
  source_security_group_id = aws_security_group.nodes-evrhiness-project-k8s-local.id
  to_port                  = 4000
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-evrhiness-project-k8s-local-ingress-tcp-4003to65535-masters-evrhiness-project-k8s-local" {
  from_port                = 4003
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-evrhiness-project-k8s-local.id
  source_security_group_id = aws_security_group.nodes-evrhiness-project-k8s-local.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "from-nodes-evrhiness-project-k8s-local-ingress-udp-1to65535-masters-evrhiness-project-k8s-local" {
  from_port                = 1
  protocol                 = "udp"
  security_group_id        = aws_security_group.masters-evrhiness-project-k8s-local.id
  source_security_group_id = aws_security_group.nodes-evrhiness-project-k8s-local.id
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "https-elb-to-master" {
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.masters-evrhiness-project-k8s-local.id
  source_security_group_id = aws_security_group.api-elb-evrhiness-project-k8s-local.id
  to_port                  = 443
  type                     = "ingress"
}

resource "aws_security_group_rule" "icmp-pmtu-api-elb-0-0-0-0--0" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 3
  protocol          = "icmp"
  security_group_id = aws_security_group.api-elb-evrhiness-project-k8s-local.id
  to_port           = 4
  type              = "ingress"
}

resource "aws_security_group_rule" "icmpv6-pmtu-api-elb-__--0" {
  from_port         = -1
  ipv6_cidr_blocks  = ["::/0"]
  protocol          = "icmpv6"
  security_group_id = aws_security_group.api-elb-evrhiness-project-k8s-local.id
  to_port           = -1
  type              = "ingress"
}

resource "aws_subnet" "us-west-2a-evrhiness-project-k8s-local" {
  availability_zone = "us-west-2a"
  cidr_block        = "172.20.32.0/19"
  tags = {
    "KubernetesCluster"                                 = "evrhiness-project.k8s.local"
    "Name"                                              = "us-west-2a.evrhiness-project.k8s.local"
    "SubnetType"                                        = "Public"
    "kubernetes.io/cluster/evrhiness-project.k8s.local" = "owned"
    "kubernetes.io/role/elb"                            = "1"
    "kubernetes.io/role/internal-elb"                   = "1"
  }
  vpc_id = aws_vpc.evrhiness-project-k8s-local.id
}

resource "aws_subnet" "us-west-2b-evrhiness-project-k8s-local" {
  availability_zone = "us-west-2b"
  cidr_block        = "172.20.64.0/19"
  tags = {
    "KubernetesCluster"                                 = "evrhiness-project.k8s.local"
    "Name"                                              = "us-west-2b.evrhiness-project.k8s.local"
    "SubnetType"                                        = "Public"
    "kubernetes.io/cluster/evrhiness-project.k8s.local" = "owned"
    "kubernetes.io/role/elb"                            = "1"
    "kubernetes.io/role/internal-elb"                   = "1"
  }
  vpc_id = aws_vpc.evrhiness-project-k8s-local.id
}

resource "aws_subnet" "us-west-2c-evrhiness-project-k8s-local" {
  availability_zone = "us-west-2c"
  cidr_block        = "172.20.96.0/19"
  tags = {
    "KubernetesCluster"                                 = "evrhiness-project.k8s.local"
    "Name"                                              = "us-west-2c.evrhiness-project.k8s.local"
    "SubnetType"                                        = "Public"
    "kubernetes.io/cluster/evrhiness-project.k8s.local" = "owned"
    "kubernetes.io/role/elb"                            = "1"
    "kubernetes.io/role/internal-elb"                   = "1"
  }
  vpc_id = aws_vpc.evrhiness-project-k8s-local.id
}

resource "aws_vpc" "evrhiness-project-k8s-local" {
  assign_generated_ipv6_cidr_block = true
  cidr_block                       = "172.20.0.0/16"
  enable_dns_hostnames             = true
  enable_dns_support               = true
  tags = {
    "KubernetesCluster"                                 = "evrhiness-project.k8s.local"
    "Name"                                              = "evrhiness-project.k8s.local"
    "kubernetes.io/cluster/evrhiness-project.k8s.local" = "owned"
  }
}

resource "aws_vpc_dhcp_options" "evrhiness-project-k8s-local" {
  domain_name         = "us-west-2.compute.internal"
  domain_name_servers = ["AmazonProvidedDNS"]
  tags = {
    "KubernetesCluster"                                 = "evrhiness-project.k8s.local"
    "Name"                                              = "evrhiness-project.k8s.local"
    "kubernetes.io/cluster/evrhiness-project.k8s.local" = "owned"
  }
}

resource "aws_vpc_dhcp_options_association" "evrhiness-project-k8s-local" {
  dhcp_options_id = aws_vpc_dhcp_options.evrhiness-project-k8s-local.id
  vpc_id          = aws_vpc.evrhiness-project-k8s-local.id
}

terraform {
  required_version = ">= 0.15.0"
  required_providers {
    aws = {
      "configuration_aliases" = [aws.files]
      "source"                = "hashicorp/aws"
      "version"               = ">= 3.59.0"
    }
  }
}
