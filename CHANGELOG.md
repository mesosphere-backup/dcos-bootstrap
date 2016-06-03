## v0.3.1 (2016-06-03)

* Improve `make bootstrap` to not override an existing authentication token once
  entered via the `dcos` CLI tool.
* Add this changelog.

## v0.3.0 (2016-05-20)

* Move dcos-bootstrap to https://github.com/dcos-labs and adapt it to work with
  open source DC/OS.
* Update to dcoscli version 0.4.4
* Update to Ansible version 2.0
* Remove Kubernetes support as it's currently not available on DC/OS. Besides,
  it's not the primary goal of dcos-bootstrap anyway.
* Remove CloudFormation templates from source tree; introduce `make
  show-template` as a replacement.
* Let Travis CI validate syntax of Ansible playbooks.

## v0.2.0 (2015-12-10)

* Allow installing Kubernetes on top of DC/OS based on HA etcd.
* Add license, use the same as Ansible does: GPL.

## v0.1.0 (2015-11-12)

* Initial version.
