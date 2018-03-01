#!/bin/bash
# Bootstrap script for VTA

LAB_FOLDER="/root/labs/RF_IDS_Lab1_Scripts"

cd ${LAB_FOLDER}
git pull

apt-get install -y python3-pip jq
pip3 -U install faker

#cd /root/labs/RF_IDS_Lab1_Scripts/scripts
/root/labs/RF_IDS_Lab1_Scripts/setup.sh
#/root/labs/RF_IDS_Lab1_Scripts/scripts/assign_ips.sh
/root/labs/simple-lab-wizard/setup_web.sh
