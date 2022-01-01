variable "eks_version" {
    type = string
}

variable "eks_name" {
    type = string
}

variable "vpc_id" {
    type = string
}

variable "subnets" {
    type = list(string)
}

variable "worker_instance_type" {
    type = string
}

variable "asg_max_size" {
    type = number
}

variable "env" {
    type = string
}