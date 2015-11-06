# Install Mesosphere DCOS on AWS using a single command

The goal of this project is to get you started with the *Mesosphere DCOS
Community Edition* in as few steps as possible.

Nothing here is meant to be used in production; that's what the [DCOS Enterprise
Edition] is for.

Disclaimer: If you use this project, you are agreeing to stick to the rules of
the [Mesosphere DCOS Community Edition EULA].

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

There are a couple of settings you might want to change:

Configure a custom SSH key for logging into DCOS cluster instances:

    make bootstrap DCOS_PUBLIC_KEY=~/.ssh/dcos.key.pub

Launch the early access release of DCOS instead of the stable release:

    make bootstrap DCOS_CHANNEL=EarlyAccess

Launch DCOS in HA setup with multiple master nodes:

    make bootstrap DCOS_MASTER_SETUP=multi-master

### Open DCOS web interface

After running `make bootstrap`, you can open the fancy DCOS web interface in
your browser:

    make web

### Use DCOS CLI

After running `make bootstrap`, you can also use the `./dcos` script to remotely
manage your cluster. The script is a convenience wrapper around the `dcos` tool
provided by Mesosphere.

This example shows how to use the CLI to install and use Kubernetes:

    ./dcos package update
    ./dcos package install --yes kubernetes
    ./dcos kubectl run nginx --image=nginx

### Destroy DCOS cluster

When you no longer need your cluster, you can delete it this way:

    make destroy

### Sync CloudFormation templates

This will sync the CloudFormation templates in `cloudformation/` with the
upstream templates used by `make bootstrap`. Useful for inspection and for
keeping track of changes.

    make sync

## More information

* https://mesosphere.com/amazon/setup/
* https://docs.mesosphere.com/install/awscluster/
* https://docs.mesosphere.com/using/cli/


[DCOS Enterprise Edition]: https://mesosphere.com/product/
[Mesosphere DCOS Community Edition EULA]: https://docs.mesosphere.com/community-edition-eula/
