# Install Mesosphere DCOS on AWS using a single command

**Note: This is just a quickstart and not meant to be used in production.**

## Usage

In order to bootstrap or destroy a DCOS cluster, you need to export these
environment variables:

* `AWS_REGION`
* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`

### Bootstrap DCOS cluster

This will set up a working Mesosphere DCOS cluster on AWS using Ansible and
CloudFormation:

    make bootstrap

You might also specify a custom SSH key for logging into DCOS cluster instances:

    make bootstrap DCOS_PUBLIC_KEY=~/.ssh/dcos.key.pub

When done, the following line will tell you the URL of the DCOS web interface:

    ok: [localhost] => {
        "msg": "Open DCOS web interface at http://..."
    }

### Destroy DCOS cluster

    make destroy

### Download CloudFormation templates for inspection

    make sync

## More information

* https://mesosphere.com/amazon/setup/
* https://docs.mesosphere.com/install/awscluster/
* https://docs.mesosphere.com/install/removeaws/
