# Set up Mesosphere DCOS on Amazon AWS

Via Ansible and CloudFormation

**Note: This is just a quickstart and not meant to be used in production.**

## Usage

In order to bootstrap or destroy a DCOS cluster, you need to export these
environment variables:

* `AWS_REGION`
* `AWS_ACCESS_KEY_ID`
* `AWS_SECRET_ACCESS_KEY`
* `DCOS_PUBLIC_KEY` (optional; path to SSH public key)

### Bootstrap DCOS cluster

    make bootstrap

### Destroy DCOS cluster

    make destroy

### Download current CloudFormation templates for inspection

    make sync

## More information

http://docs.mesosphere.com/install/awscluster/
