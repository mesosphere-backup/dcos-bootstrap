# Set up Mesosphere DCOS on Amazon AWS

Via Ansible and CloudFormation

**Note: This is just a quickstart and not meant to be used in production.**

## Usage

For bootstrap or destroy to work, you need to export the environment variables
`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` first. The AWS region is
configured in `vars/aws.yml`.

### Bootstrap DCOS cluster

    make bootstrap

### Destroy DCOS cluster

    make destroy

### Download current CloudFormation templates for inspection

    make sync

## More information

http://docs.mesosphere.com/install/awscluster/
