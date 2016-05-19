# Install Mesosphere DC/OS on AWS using a single command

**[Read this blog post to learn more about DC/OS and dcos-bootstrap!][blog]**

The project's goal is to get you started with [Mesosphere DC/OS] on AWS with as
few steps as possible. Rather than following the [AWS DC/OS Installation Guide],
you can use the provided tooling to launch a DC/OS cluster with a single command
-- and delete it just as easily.

Note: Nothing here is meant to be used in production; that's what [Mesosphere Enterprise DC/OS] is for.

## Installation

Clone this repository and run one of the Make targets as documented below:

```bash
git clone https://github.com/dcos-labs/dcos-bootstrap
cd dcos-bootstrap/
make ...
```

Besides Make, you will also need Python and virtualenv.

## Usage

### AWS configuration

In order to bootstrap or destroy a DC/OS cluster, you need to export these
environment variables first:

* `AWS_REGION`
* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`

### Bootstrap DC/OS cluster

This will set up a working Mesosphere DC/OS cluster on AWS using Ansible and
CloudFormation:

    make bootstrap

There are a couple of settings you might want to change:

* `DCOS_CLUSTER_NAME` - Name of DC/OS cluster (and CloudFormation stack)
* `DCOS_ADMIN_KEY` - Path to public SSH key to be added to cluster instances
* `DCOS_ADMIN_LOCATION` - IP range to whitelist for admin access
* `DCOS_WORKER_NODES` - Number of worker nodes to launch
* `DCOS_PUBLIC_WORKER_NODES` - Number of public worker nodes to launch
* `DCOS_CHANNEL` - Launch `stable` or `EarlyAccess` release of DC/OS
* `DCOS_MASTER_SETUP` - Launch DC/OS in `single-master` or `multi-master` HA setup

Here's how to specify different settings:

    make bootstrap DCOS_CLUSTER_NAME=dcos-test DCOS_CHANNEL=EarlyAccess DCOS_WORKER_NODES=10

### Open DC/OS web interface

After running `make bootstrap`, you can open the fancy DC/OS web interface in
your browser:

    make dashboard

### Use DC/OS CLI

After bootstrapping DC/OS, you can also use the `./dcos` script to remotely
manage your cluster. The script is a convenience wrapper around the [dcos tool]
provided by Mesosphere. Run `./dcos` without parameters to get a list of all
available commands.

### Install Kubernetes

This will deploy [Kubernetes] on top of DC/OS:

    make kubernetes

Afterwards, run the `kubectl` subcommand to control the Kubernetes cluster
manager. For example:

    ./dcos kubectl run nginx --image=nginx

### Destroy DC/OS cluster

When you no longer need your cluster, you can delete it this way:

    make destroy

In case you changed the default cluster name:

    make destroy DCOS_CLUSTER_NAME=...

### Sync CloudFormation templates

This will download the current CloudFormation templates provided by Mesosphere
from S3 to `cloudformation/`. Useful for inspection and for keeping track of
infrastructure changes.

    make sync

[Mesosphere DC/OS]: https://dcos.io/
[AWS DC/OS Installation Guide]: https://dcos.io/docs/latest/administration/installing/cloud/aws/
[Mesosphere Enterprise DC/OS]: https://mesosphere.com/enterprise/
[dcos tool]: https://dcos.io/docs/latest/usage/cli/
[blog]: https://mlafeldt.github.io/blog/getting-started-with-the-mesosphere-dcos/
[Kubernetes]: http://kubernetes.io/
