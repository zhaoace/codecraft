#!/usr/bin/env bash

virtualenv /tmp/orca_update_venv
source /tmp/orca_update_venv/bin/activate
pip install -U pip splunk_orca -i https://repo.splunk.com/artifactory/api/pypi/pypi-virtual/simple

rm -rf ~/.orca
rm -rf ~/.orca.tar
expect expect_for_orca.sh

cd ~
tar -cf .orca.tar .orca


# crontab -e
# 0 5 * * 1  cd /opt/jenkins/userContent && bash update_orca_in_jenkins_master.sh
