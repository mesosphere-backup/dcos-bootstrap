AWS_REGION      ?= eu-west-1
DCOS_PUBLIC_KEY ?= ~/.ssh/id_rsa.pub

bootstrap: venv
	venv/bin/ansible-playbook -v dcos.yml \
		-e aws_region="$(AWS_REGION)" \
		-e dcos_public_key="$(DCOS_PUBLIC_KEY)"

destroy: venv
	venv/bin/ansible-playbook -v dcos_destroy.yml \
		-e aws_region="$(AWS_REGION)"

venv:
	virtualenv venv
	venv/bin/pip install -q -r requirements.txt

TEMPLATES_ROOT = https://s3.amazonaws.com/downloads.mesosphere.io/dcos
sync:
	curl $(TEMPLATES_ROOT)/stable/cloudformation/single-master.cloudformation.json | jq . >cloudformation/stable/single-master.json
	curl $(TEMPLATES_ROOT)/stable/cloudformation/multi-master.cloudformation.json | jq . >cloudformation/stable/multi-master.json
	curl $(TEMPLATES_ROOT)/EarlyAccess/cloudformation/single-master.cloudformation.json | jq . >cloudformation/earlyaccess/single-master.json
	curl $(TEMPLATES_ROOT)/EarlyAccess/cloudformation/multi-master.cloudformation.json | jq . >cloudformation/earlyaccess/multi-master.json

.PHONY: venv
