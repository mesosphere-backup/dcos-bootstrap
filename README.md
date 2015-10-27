# Set up Mesosphere DCOS on Amazon AWS

Via Ansible and CloudFormation

**Note: This is just a "quick start" and not meant to be used in production.**

## Usage

For bootstrap/destroy to work, you need to export `AWS_*` environment variables
first.

### Bootstrap DCOS cluster

    make bootstrap

### Destroy DCOS cluster

    make destroy

### Download current CloudFormation templates for inspection

    make sync

## More information

http://docs.mesosphere.com/install/awscluster/
