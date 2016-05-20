variable "aws_region" {
  description = "AWS region to create DC/OS in"
  default     = "eu-west-1"
}

variable "dcos_cluster_name" {
  description = "Name of DC/OS cluster and corresponding CloudFormation stack"
  default     = "dcos"
}

variable "dcos_admin_key" {
  description = "Path to public SSH key to be added to DC/OS cluster instances"
  default     = "~/.ssh/id_rsa.pub"
}

variable "dcos_admin_location" {
  description = "IP range to whitelist for admin access"
  default     = "0.0.0.0/0"
}

variable "dcos_oauth_enabled" {
  description = "Enable or disable OAuth authentication"
  default     = "true"
}

variable "dcos_worker_nodes" {
  description = "Number of worker nodes to launch"
  default     = 5
}

variable "dcos_public_worker_nodes" {
  description = "Number of public worker nodes to launch"
  default     = 1
}

variable "dcos_channel" {
  description = "Name of DC/OS release channel"
  default     = "EarlyAccess"
}

variable "dcos_master_setup" {
  description = "Launch DC/OS in 'single-master' or 'multi-master' HA setup"
  default     = "single-master"
}
