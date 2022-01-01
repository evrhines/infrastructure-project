resource "aws_iam_user" "kops_user" {
  name = "kops"
  path = "/system/infra/"

  tags = {
    env     = var.env
    owner   = "SRE"
    contact = "evrhiness@gmail.com"
  }
}

data "aws_iam_policy_document" "kops_ec2_full_policy" {
  statement {
    actions   = ["ec2:*", "elasticloadbalancing:*", "cloudwatch:*", "autoscaling:*"]
    effect    = "Allow"
    resources = ["*"]
  }
  statement {
    effect    = "Allow"
    actions   = ["iam:CreateServiceLinkedRole"]
    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "iam:AWSServiceName"
      values = [
        "autoscaling.amazonaws.com",
        "ec2scheduled.amazonaws.com",
        "elasticloadbalancing.amazonaws.com",
        "spot.amazonaws.com",
        "spotfleet.amazonaws.com",
        "transitgateway.amazonaws.com"
      ]
    }
  }
}

data "aws_iam_policy_document" "kops_route53_full_policy" {

  statement {
    effect = "Allow"
    actions = [
      "route53:*",
      "route53domains:*",
      "cloudfront:ListDistributions",
      "elasticloadbalancing:DescribeLoadBalancers",
      "elasticbeanstalk:DescribeEnvironments",
      "s3:ListBucket",
      "s3:GetBucketLocation",
      "s3:GetBucketWebsite",
      "ec2:DescribeVpcs",
      "ec2:DescribeVpcEndpoints",
      "ec2:DescribeRegions",
      "sns:ListTopics",
      "sns:ListSubscriptionsByTopic",
      "cloudwatch:DescribeAlarms",
      "cloudwatch:GetMetricStatistics"
    ]
    resources = ["*"]
  }

  statement {
    effect    = "Allow"
    actions   = ["apigateway:GET"]
    resources = ["arn:aws:apigateway:*::/domainnames"]
  }

}

data "aws_iam_policy_document" "kops_s3_full_policy" {

  statement {
    effect = "Allow"
    actions = [
      "s3:*",
      "s3-object-lambda:*"
    ]
    resources = ["*"]
  }

}

data "aws_iam_policy_document" "kops_iam_full_policy" {

  statement {
    effect = "Allow"
    actions = [
      "iam:*",
      "organizations:DescribeAccount",
      "organizations:DescribeOrganization",
      "organizations:DescribeOrganizationalUnit",
      "organizations:DescribePolicy",
      "organizations:ListChildren",
      "organizations:ListParents",
      "organizations:ListPoliciesForTarget",
      "organizations:ListRoots",
      "organizations:ListPolicies",
      "organizations:ListTargetsForPolicy"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "kops_vpc_full_policy" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:AcceptVpcPeeringConnection",
      "ec2:AcceptVpcEndpointConnections",
      "ec2:AllocateAddress",
      "ec2:AssignIpv6Addresses",
      "ec2:AssignPrivateIpAddresses",
      "ec2:AssociateAddress",
      "ec2:AssociateDhcpOptions",
      "ec2:AssociateRouteTable",
      "ec2:AssociateSubnetCidrBlock",
      "ec2:AssociateVpcCidrBlock",
      "ec2:AttachClassicLinkVpc",
      "ec2:AttachInternetGateway",
      "ec2:AttachNetworkInterface",
      "ec2:AttachVpnGateway",
      "ec2:AuthorizeSecurityGroupEgress",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:CreateCarrierGateway",
      "ec2:CreateCustomerGateway",
      "ec2:CreateDefaultSubnet",
      "ec2:CreateDefaultVpc",
      "ec2:CreateDhcpOptions",
      "ec2:CreateEgressOnlyInternetGateway",
      "ec2:CreateFlowLogs",
      "ec2:CreateInternetGateway",
      "ec2:CreateLocalGatewayRouteTableVpcAssociation",
      "ec2:CreateNatGateway",
      "ec2:CreateNetworkAcl",
      "ec2:CreateNetworkAclEntry",
      "ec2:CreateNetworkInterface",
      "ec2:CreateNetworkInterfacePermission",
      "ec2:CreateRoute",
      "ec2:CreateRouteTable",
      "ec2:CreateSecurityGroup",
      "ec2:CreateSubnet",
      "ec2:CreateTags",
      "ec2:CreateVpc",
      "ec2:CreateVpcEndpoint",
      "ec2:CreateVpcEndpointConnectionNotification",
      "ec2:CreateVpcEndpointServiceConfiguration",
      "ec2:CreateVpcPeeringConnection",
      "ec2:CreateVpnConnection",
      "ec2:CreateVpnConnectionRoute",
      "ec2:CreateVpnGateway",
      "ec2:DeleteCarrierGateway",
      "ec2:DeleteCustomerGateway",
      "ec2:DeleteDhcpOptions",
      "ec2:DeleteEgressOnlyInternetGateway",
      "ec2:DeleteFlowLogs",
      "ec2:DeleteInternetGateway",
      "ec2:DeleteLocalGatewayRouteTableVpcAssociation",
      "ec2:DeleteNatGateway",
      "ec2:DeleteNetworkAcl",
      "ec2:DeleteNetworkAclEntry",
      "ec2:DeleteNetworkInterface",
      "ec2:DeleteNetworkInterfacePermission",
      "ec2:DeleteRoute",
      "ec2:DeleteRouteTable",
      "ec2:DeleteSecurityGroup",
      "ec2:DeleteSubnet",
      "ec2:DeleteTags",
      "ec2:DeleteVpc",
      "ec2:DeleteVpcEndpoints",
      "ec2:DeleteVpcEndpointConnectionNotifications",
      "ec2:DeleteVpcEndpointServiceConfigurations",
      "ec2:DeleteVpcPeeringConnection",
      "ec2:DeleteVpnConnection",
      "ec2:DeleteVpnConnectionRoute",
      "ec2:DeleteVpnGateway",
      "ec2:DescribeAccountAttributes",
      "ec2:DescribeAddresses",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeCarrierGateways",
      "ec2:DescribeClassicLinkInstances",
      "ec2:DescribeCustomerGateways",
      "ec2:DescribeDhcpOptions",
      "ec2:DescribeEgressOnlyInternetGateways",
      "ec2:DescribeFlowLogs",
      "ec2:DescribeInstances",
      "ec2:DescribeInternetGateways",
      "ec2:DescribeIpv6Pools",
      "ec2:DescribeLocalGatewayRouteTables",
      "ec2:DescribeLocalGatewayRouteTableVpcAssociations",
      "ec2:DescribeKeyPairs",
      "ec2:DescribeMovingAddresses",
      "ec2:DescribeNatGateways",
      "ec2:DescribeNetworkAcls",
      "ec2:DescribeNetworkInterfaceAttribute",
      "ec2:DescribeNetworkInterfacePermissions",
      "ec2:DescribeNetworkInterfaces",
      "ec2:DescribePrefixLists",
      "ec2:DescribeRouteTables",
      "ec2:DescribeSecurityGroupReferences",
      "ec2:DescribeSecurityGroupRules",
      "ec2:DescribeSecurityGroups",
      "ec2:DescribeStaleSecurityGroups",
      "ec2:DescribeSubnets",
      "ec2:DescribeTags",
      "ec2:DescribeVpcAttribute",
      "ec2:DescribeVpcClassicLink",
      "ec2:DescribeVpcClassicLinkDnsSupport",
      "ec2:DescribeVpcEndpointConnectionNotifications",
      "ec2:DescribeVpcEndpointConnections",
      "ec2:DescribeVpcEndpoints",
      "ec2:DescribeVpcEndpointServiceConfigurations",
      "ec2:DescribeVpcEndpointServicePermissions",
      "ec2:DescribeVpcEndpointServices",
      "ec2:DescribeVpcPeeringConnections",
      "ec2:DescribeVpcs",
      "ec2:DescribeVpnConnections",
      "ec2:DescribeVpnGateways",
      "ec2:DetachClassicLinkVpc",
      "ec2:DetachInternetGateway",
      "ec2:DetachNetworkInterface",
      "ec2:DetachVpnGateway",
      "ec2:DisableVgwRoutePropagation",
      "ec2:DisableVpcClassicLink",
      "ec2:DisableVpcClassicLinkDnsSupport",
      "ec2:DisassociateAddress",
      "ec2:DisassociateRouteTable",
      "ec2:DisassociateSubnetCidrBlock",
      "ec2:DisassociateVpcCidrBlock",
      "ec2:EnableVgwRoutePropagation",
      "ec2:EnableVpcClassicLink",
      "ec2:EnableVpcClassicLinkDnsSupport",
      "ec2:ModifyNetworkInterfaceAttribute",
      "ec2:ModifySecurityGroupRules",
      "ec2:ModifySubnetAttribute",
      "ec2:ModifyVpcAttribute",
      "ec2:ModifyVpcEndpoint",
      "ec2:ModifyVpcEndpointConnectionNotification",
      "ec2:ModifyVpcEndpointServiceConfiguration",
      "ec2:ModifyVpcEndpointServicePermissions",
      "ec2:ModifyVpcPeeringConnectionOptions",
      "ec2:ModifyVpcTenancy",
      "ec2:MoveAddressToVpc",
      "ec2:RejectVpcEndpointConnections",
      "ec2:RejectVpcPeeringConnection",
      "ec2:ReleaseAddress",
      "ec2:ReplaceNetworkAclAssociation",
      "ec2:ReplaceNetworkAclEntry",
      "ec2:ReplaceRoute",
      "ec2:ReplaceRouteTableAssociation",
      "ec2:ResetNetworkInterfaceAttribute",
      "ec2:RestoreAddressToClassic",
      "ec2:RevokeSecurityGroupEgress",
      "ec2:RevokeSecurityGroupIngress",
      "ec2:UnassignIpv6Addresses",
      "ec2:UnassignPrivateIpAddresses",
      "ec2:UpdateSecurityGroupRuleDescriptionsEgress",
      "ec2:UpdateSecurityGroupRuleDescriptionsIngress"
    ]
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "kops_sqs_full_policy" {
  statement {
    actions = [
      "sqs:*"
    ]
    effect    = "Allow"
    resources = ["*"]
  }
}

data "aws_iam_policy_document" "kops_eb_full_policy" {

  statement {
    effect    = "Allow"
    actions   = ["events:*"]
    resources = ["*"]
  }
  statement {
    effect    = "Allow"
    actions   = ["iam:CreateServiceLinkedRole"]
    resources = ["arn:aws:iam::*:role/aws-service-role/AmazonEventBridgeApiDestinationsServiceRolePolicy"]
    condition {
      test     = "StringEquals"
      variable = "iam:AWSServiceName"
      values   = ["apidestinations.events.amazonaws.com"]
    }
  }
  statement {
    effect = "Allow"
    actions = [
      "secretsmanager:CreateSecret",
      "secretsmanager:UpdateSecret",
      "secretsmanager:DeleteSecret",
      "secretsmanager:GetSecretValue",
      "secretsmanager:PutSecretValue"
    ]
    resources = ["arn:aws:secretsmanager:*:*:secret:events!*"]
  }
  statement {
    effect    = "Allow"
    actions   = ["iam:PassRole"]
    resources = ["arn:aws:iam::*:role/*"]
    condition {
      test     = "StringLike"
      variable = "iam:PassedToService"
      values   = ["events.amazonaws.com"]
    }
  }
}

resource "aws_iam_group_policy_attachment" "ec2_attach" {
  group      = aws_iam_group.kops_group.name
  policy_arn = aws_iam_policy.kops_ec2_policy.arn
}

resource "aws_iam_policy" "kops_ec2_policy" {
  name = "kops-ec2"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = data.aws_iam_policy_document.kops_ec2_full_policy.json
}

resource "aws_iam_policy" "kops_route53_policy" {
  name = "kops-route53"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = data.aws_iam_policy_document.kops_route53_full_policy.json
}

resource "aws_iam_policy" "kops_s3_policy" {
  name = "kops-s3"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = data.aws_iam_policy_document.kops_s3_full_policy.json
}

resource "aws_iam_policy" "kops_iam_policy" {
  name = "kops-iam"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = data.aws_iam_policy_document.kops_iam_full_policy.json
}

resource "aws_iam_policy" "kops_vpc_policy" {
  name = "kops-vpc"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = data.aws_iam_policy_document.kops_vpc_full_policy.json
}

resource "aws_iam_policy" "kops_sqs_policy" {
  name = "kops-sqs"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = data.aws_iam_policy_document.kops_sqs_full_policy.json
}


resource "aws_iam_policy" "kops_eb_policy" {
  name = "kops-eb"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = data.aws_iam_policy_document.kops_eb_full_policy.json
}

resource "aws_iam_group" "kops_group" {
  name = "kops-group"
}


resource "aws_iam_group_membership" "kops_member" {
  name = "kops-membership"

  users = [
    aws_iam_user.kops_user.name,
  ]

  group = aws_iam_group.kops_group.name
}