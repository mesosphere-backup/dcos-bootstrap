# Install Mesosphere DCOS on AWS using a single command

The project's goal is to get you started with the *Mesosphere DCOS Community
Edition* on AWS with as few steps as possible. Rather than following the
official [AWS setup guide], you can use the provided tooling to launch a DCOS
cluster with a single command -- and delete it just as easily.

Note: Nothing here is meant to be used in production; that's what the [DCOS
Enterprise Edition] is for.

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

* `DCOS_CLUSTER_NAME` - Name of DCOS cluster (and CloudFormation stack)
* `DCOS_PUBLIC_KEY` - Path to SSH key for logging into DCOS cluster instances
* `DCOS_ADMIN_LOCATION` - IP range to whitelist for admin access
* `DCOS_WORKER_NODES` - Number of worker nodes to launch
* `DCOS_PUBLIC_WORKER_NODES` - Number of public worker nodes to launch
* `DCOS_CHANNEL` - Launch `stable` or `EarlyAccess` release of DCOS
* `DCOS_MASTER_SETUP` - Launch DCOS in `single-master` or `multi-master` HA setup

Here's how to specify different settings:

    make bootstrap DCOS_CLUSTER_NAME=dcos-test DCOS_CHANNEL=EarlyAccess DCOS_WORKER_NODES=10

### Open DCOS web interface

After running `make bootstrap`, you can open the fancy DCOS web interface in
your browser:

    make web

### Use DCOS CLI

After running `make bootstrap`, you can also use the `./dcos` script to remotely
manage your cluster. The script is a convenience wrapper around the [dcos tool]
provided by Mesosphere.

This example shows how to use the CLI to install and use Kubernetes:

    ./dcos package update
    ./dcos package install --yes kubernetes
    ./dcos kubectl run nginx --image=nginx

### Destroy DCOS cluster

When you no longer need your cluster, you can delete it this way:

    make destroy

In case you changed the default cluster name:

    make destroy DCOS_CLUSTER_NAME=...

### Sync CloudFormation templates

This will sync the CloudFormation templates in `cloudformation/` with the
upstream templates used by `make bootstrap`. Useful for inspection and for
keeping track of changes.

    make sync


[AWS setup guide]: https://docs.mesosphere.com/install/awscluster/
[DCOS Enterprise Edition]: https://mesosphere.com/product/
[Mesosphere DCOS Community Edition EULA]: https://docs.mesosphere.com/community-edition-eula/
[dcos tool]: https://docs.mesosphere.com/using/cli/
