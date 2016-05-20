output "dcos_url" {
  value = "http://${aws_cloudformation_stack.dcos.outputs.DnsAddress}"
}
