#!/bin/bash
# Bootstrap script for VTA
export LC_ALL=C
echo "Start bootstrap" >> /root/running/setup.log
LAB_FOLDER="/root/labs/RF_IDS_Lab1_Scripts"
PRODUCT=$(dmidecode -s system-product-name)

cd ${LAB_FOLDER}
git pull
echo "Did git pull" >> /root/running/setup.log
apt-get install -y python3-pip jq
pip3 install faker

if [ "${PRODUCT}" == "VirtualBox" ]; then
       echo "Running in template, doing no further setup"
       exit 0
fi

#cd /root/labs/RF_IDS_Lab1_Scripts/scripts
. ${LAB_FOLDER}/setup.sh
. ${LAB_FOLDER}/scripts/assign_ips.sh
. ${LAB_FOLDER}/scripts/web.sh
. /root/labs/ci-modular-target-checks/setup.sh
echo "Finish bootstrap" >> /root/running/setup.log
exit 0
