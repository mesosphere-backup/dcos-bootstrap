provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_key_pair" "dcos" {
  key_name   = "dcos_admin"
  public_key = "${file(var.dcos_admin_key)}"
}

resource "aws_cloudformation_stack" "dcos" {
  name         = "${var.dcos_cluster_name}"
  template_url = "https://s3-us-west-2.amazonaws.com/downloads.dcos.io/dcos/${var.dcos_channel}/cloudformation/${var.dcos_master_setup}.cloudformation.json"
  capabilities = ["CAPABILITY_IAM"]

  parameters {
    KeyName                  = "${aws_key_pair.dcos.key_name}"
    AdminLocation            = "${var.dcos_admin_location}"
    OAuthEnabled             = "${var.dcos_oauth_enabled}"
    SlaveInstanceCount       = "${var.dcos_worker_nodes}"
    PublicSlaveInstanceCount = "${var.dcos_public_worker_nodes}"
  }
}
