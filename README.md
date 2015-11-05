# Install Mesosphere DCOS on AWS using a single command

**Note: This is just a quickstart and not meant to be used in production (yet).**

## Installation

Clone this repository and run one of the Make targets as documented below:

    git clone https://github.com/mlafeldt/dcos-bootstrap
    cd dcos-bootstrap/
    make ...

Besides Make, you will also need Python and virtualenv.

## Usage

### AWS configuration

In order to bootstrap or destroy a DCOS cluster, you need to export these
environment variables first:

* `AWS_REGION`
* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`

### Bootstrap DCOS cluster

This will set up a working Mesosphere DCOS cluster on AWS using Ansible and
CloudFormation:

    make bootstrap

When done, the following line will tell you the URL of the DCOS web interface:

    ok: [localhost] => {
        "msg": "Open DCOS web interface at http://..."
    }

There are a couple of settings you might want to change:

Configure a custom SSH key for logging into DCOS cluster instances:

    make bootstrap DCOS_PUBLIC_KEY=~/.ssh/dcos.key.pub

Launch the early access release of DCOS instead of the stable release:

    make bootstrap DCOS_CHANNEL=EarlyAccess

Launch DCOS in HA setup with multiple master nodes:

    make bootstrap DCOS_MASTER_SETUP=multi-master

### Use DCOS CLI

After running `make bootstrap`, you can use `script/dcos` to remotely manage
your cluster. The script is a convenience wrapper around the `dcos` tool.

This example shows how to use the CLI to install and use Kubernetes:

    script/dcos package update
    script/dcos package install --yes kubernetes
    script/dcos kubectl run nginx --image=nginx

### Destroy DCOS cluster

When you no longer need your cluster, you can delete it this way:

    make destroy

### Sync CloudFormation templates

This will sync the CloudFormation templates in `cloudformation/` with the
upstream templates used by `make bootstrap`. This is useful for inspection and
for keeping track of changes.

    make sync

## More information

* https://mesosphere.com/amazon/setup/
* https://docs.mesosphere.com/install/awscluster/
* https://docs.mesosphere.com/using/cli/
