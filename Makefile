bootstrap:
	ansible-playbook -v dcos.yml

destroy:
	ansible-playbook -v dcos_destroy.yml

TEMPLATES_ROOT = https://s3.amazonaws.com/downloads.mesosphere.io/dcos
sync:
	curl $(TEMPLATES_ROOT)/stable/cloudformation/single-master.cloudformation.json | jq . >cloudformation/stable/single-master.json
	curl $(TEMPLATES_ROOT)/stable/cloudformation/multi-master.cloudformation.json | jq . >cloudformation/stable/multi-master.json
	curl $(TEMPLATES_ROOT)/EarlyAccess/cloudformation/single-master.cloudformation.json | jq . >cloudformation/earlyaccess/single-master.json
	curl $(TEMPLATES_ROOT)/EarlyAccess/cloudformation/multi-master.cloudformation.json | jq . >cloudformation/earlyaccess/multi-master.json
