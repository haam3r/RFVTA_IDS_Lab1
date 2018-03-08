#!/bin/bash
# Bootstrap script for VTA
export LC_ALL=C
echo "Start bootstrap" >> /root/running/setup.log
LAB_FOLDER="/root/labs/RF_IDS_Lab1_Scripts"

cd ${LAB_FOLDER}
git pull
echo "Did git pull" >> /root/running/setup.log
apt-get install -y python3-pip jq
pip3 install faker

#cd /root/labs/RF_IDS_Lab1_Scripts/scripts
. /root/labs/RF_IDS_Lab1_Scripts/setup.sh
#. /root/labs/RF_IDS_Lab1_Scripts/scripts/assign_ips.sh
. /root/labs/simple-lab-wizard/setup_web.sh
echo "Finish bootstrap" >> /root/running/setup.log
