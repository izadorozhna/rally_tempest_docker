#!/bin/bash -xe

source /home/rally/keystonercv3

rally-manage db recreate
rally deployment create --fromenv --name=tempest
rally verify create-verifier --type tempest --name tempest-verifier --source /var/lib/tempest --version 14.0.0 --system-wide
rally verify configure-verifier --extend /var/lib/extra-options.conf
rally verify configure-verifier --show
rally verify start --skip_list /var/lib/skip-list 
rally verify report --type junit-xml --to report.xml