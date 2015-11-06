AWS_REGION        ?= eu-west-1
DCOS_PUBLIC_KEY   ?= ~/.ssh/id_rsa.pub
DCOS_CHANNEL      ?= stable
DCOS_MASTER_SETUP ?= single-master

bootstrap: venv
	venv/bin/ansible-playbook -v bootstrap.yml \
		-e aws_region="$(AWS_REGION)" \
		-e dcos_public_key="$(DCOS_PUBLIC_KEY)" \
		-e dcos_channel="$(DCOS_CHANNEL)" \
		-e dcos_master_setup="$(DCOS_MASTER_SETUP)"

destroy: venv
	venv/bin/ansible-playbook -v destroy.yml \
		-e aws_region="$(AWS_REGION)" \
		-e dcos_channel="$(DCOS_CHANNEL)" \
		-e dcos_master_setup="$(DCOS_MASTER_SETUP)"

venv:
	virtualenv venv
	venv/bin/pip install -q -r requirements.txt

clean:
	$(RM) -r tmp venv

TEMPLATES_ROOT = https://s3.amazonaws.com/downloads.mesosphere.io/dcos
sync:
	curl $(TEMPLATES_ROOT)/stable/cloudformation/single-master.cloudformation.json | jq . >cloudformation/stable/single-master.json
	curl $(TEMPLATES_ROOT)/stable/cloudformation/multi-master.cloudformation.json | jq . >cloudformation/stable/multi-master.json
	curl $(TEMPLATES_ROOT)/EarlyAccess/cloudformation/single-master.cloudformation.json | jq . >cloudformation/earlyaccess/single-master.json
	curl $(TEMPLATES_ROOT)/EarlyAccess/cloudformation/multi-master.cloudformation.json | jq . >cloudformation/earlyaccess/multi-master.json

.PHONY: venv
