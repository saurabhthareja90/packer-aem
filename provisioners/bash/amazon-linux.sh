#!/usr/bin/env bash
set -o nounset
set -o errexit

yum -y upgrade

# Installing puppet5, ony when its Amazon Linux 2 LTS Candidate AMI 2017.12.0 (HVM)
sudo rpm -Uvh https://yum.puppet.com/puppet5/puppet5-release-el-7.noarch.rpm
yum -y install puppet-agent

# Required to install python-cheetah
sudo rpm -ivh --force https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

# none of the available repos have collectd or collectd-python. We had to add them manually :(
sudo rpm -ivh --force https://buildlogs.centos.org/centos/7/opstools/x86_64/perfmon/collectd-5.8.0-1.el7.x86_64.rpm
sudo rpm -ivh --force https://buildlogs.centos.org/centos/7/opstools/x86_64/perfmon/collectd-python-5.8.0-1.el7.x86_64.rpm

exit 0
