#!/bin/bash

## Run as sudo or as user with ability to run all commands below.

install_terraform() {
	apt-get update && apt-get install -y gnupg software-properties-common curl
	curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
	apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
        apt-get update && apt-get install terraform
}

install_kubectl() {
	curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
	install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
	kubectl version --client
}

install_terragrunt() {
	curl -LO https://github.com/gruntwork-io/terragrunt/releases/download/v0.35.16/terragrunt_linux_amd64
	TF_PATH=$(which terraform)
	chmod 0755 terragrunt_linux_amd64
	mv terragrunt_linux_amd64 ${TF_PATH%\/*}/terragrunt
}

install_jq() {
	apt-get update && apt-get install -y jq
}

TERRAFORM_ON_PATH=$(which terraform)
if [ ! -n "$TERRAFORM_ON_PATH" ]; then
	install_terraform
fi

KUBECTL_ON_PATH=$(which kubectl)
if [ ! -n "$KUBECTL_ON_PATH" ]; then
	install_kubectl
fi

TERRAGRUNT_ON_PATH=$(which terragrunt)
if [ ! -n "$TERRAGRUNT_ON_PATH" ]; then
	install_terragrunt
fi

JQ_ON_PATH=$(which jq)
if [ ! -n "$JQ_ON_PATH" ]; then
	install_jq
fi
# kops create cluster --name=evrhiness-project.k8s.local --state=s3://kops-state  \
# 	--dns-zone=evrhiness-project.k8s.local --target=terraform --out=./kops/ \
# 	--zones=us-west-2a,us-west-2b,us-west-2c --cloud=aws --node-count 3 \
# 	--master-zones us-west-2a,us-west-2b,us-west-2c --topology private \
# 	--networking calico