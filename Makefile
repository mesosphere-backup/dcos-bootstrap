AWS_REGION ?= eu-west-1

DCOS_CLUSTER_NAME        ?= dcos
DCOS_ADMIN_KEY           ?= ~/.ssh/id_rsa.pub
DCOS_ADMIN_LOCATION      ?= 0.0.0.0/0
DCOS_OAUTH_ENABLED       ?= true
DCOS_WORKER_NODES        ?= 5
DCOS_PUBLIC_WORKER_NODES ?= 1
DCOS_CHANNEL             ?= EarlyAccess
DCOS_MASTER_SETUP        ?= single-master

bootstrap:
	terraform apply \
		-var aws_region="$(AWS_REGION)" \
		-var dcos_cluster_name="$(DCOS_CLUSTER_NAME)" \
		-var dcos_admin_key="$(DCOS_ADMIN_KEY)" \
		-var dcos_admin_location="$(DCOS_ADMIN_LOCATION)" \
		-var dcos_oauth_enabled="$(DCOS_OAUTH_ENABLED)" \
		-var dcos_worker_nodes="$(DCOS_WORKER_NODES)" \
		-var dcos_public_worker_nodes="$(DCOS_PUBLIC_WORKER_NODES)" \
		-var dcos_channel="$(DCOS_CHANNEL)" \
		-var dcos_master_setup="$(DCOS_MASTER_SETUP)"

destroy:
	terraform destroy -force \
		-var dcos_cluster_name="$(DCOS_CLUSTER_NAME)" \
		-var aws_region="$(AWS_REGION)" \
		-var dcos_channel="$(DCOS_CHANNEL)" \
		-var dcos_master_setup="$(DCOS_MASTER_SETUP)"

test:
	terraform validate

dashboard:
	@open $$(terraform output dcos_url)

clean:
	$(RM) -r .terraform*

show-template:
	@curl -f -s https://downloads.dcos.io/dcos/$(DCOS_CHANNEL)/cloudformation/$(DCOS_MASTER_SETUP).cloudformation.json | jq .
