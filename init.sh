#!/bin/bash

## Run as sudo or as user with ability to run all commands below.

install_terraform() {
	apt-get update && apt-get install -y gnupg software-properties-common curl
	curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -
	apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
        apt-get update && apt-get install terraform
}

TERRAFORM_ON_PATH=$(which terraform)
if [ ! -n "$TERRAFORM_ON_PATH" ]; then
	install_terraform
fi
