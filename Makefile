AWS_REGION ?= eu-west-1

DCOS_CLUSTER_NAME        ?= dcos
DCOS_ADMIN_KEY           ?= ~/.ssh/id_rsa.pub
DCOS_ADMIN_LOCATION      ?= 0.0.0.0/0
DCOS_OAUTH_ENABLED       ?= true
DCOS_WORKER_NODES        ?= 5
DCOS_PUBLIC_WORKER_NODES ?= 1
DCOS_CHANNEL             ?= EarlyAccess
DCOS_MASTER_SETUP        ?= single-master

bootstrap: venv
	venv/bin/ansible-playbook -v bootstrap.yml \
		-e aws_region="$(AWS_REGION)" \
		-e dcos_cluster_name="$(DCOS_CLUSTER_NAME)" \
		-e dcos_admin_key="$(DCOS_ADMIN_KEY)" \
		-e dcos_admin_location="$(DCOS_ADMIN_LOCATION)" \
		-e dcos_oauth_enabled="$(DCOS_OAUTH_ENABLED)" \
		-e dcos_worker_nodes="$(DCOS_WORKER_NODES)" \
		-e dcos_public_worker_nodes="$(DCOS_PUBLIC_WORKER_NODES)" \
		-e dcos_channel="$(DCOS_CHANNEL)" \
		-e dcos_master_setup="$(DCOS_MASTER_SETUP)"

destroy: venv
	venv/bin/ansible-playbook -v destroy.yml \
		-e dcos_cluster_name="$(DCOS_CLUSTER_NAME)" \
		-e aws_region="$(AWS_REGION)" \
		-e dcos_channel="$(DCOS_CHANNEL)" \
		-e dcos_master_setup="$(DCOS_MASTER_SETUP)"

test: venv
	venv/bin/ansible-playbook --syntax-check *.yml

dashboard:
	@open $$(./dcos config show core.dcos_url)

venv:
	virtualenv venv
	venv/bin/pip install -q -r requirements.txt

clean:
	$(RM) -r tmp venv

show-template:
	@curl -f -s https://downloads.dcos.io/dcos/$(DCOS_CHANNEL)/cloudformation/$(DCOS_MASTER_SETUP).cloudformation.json | jq .

.PHONY: venv
