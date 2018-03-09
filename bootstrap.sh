#!/bin/bash
# Bootstrap script for VTA
export LC_ALL=C
echo "Start bootstrap" >> /root/running/setup.log
LAB_FOLDER="/root/labs/RF_IDS_Lab1_Scripts"
CI_TARGET="/root/labs/ci-modular-target"
CI_TARGET_CHECKS="/root/labs/ci-modular-target-checks"
PRODUCT=$(dmidecode -s system-product-name)

cd ${CI_TARGET}
git pull

cd ${CI_TARGET_CHECKS}
git pull

cd ${LAB_FOLDER}
git pull

echo "Did git pulls" >> /root/running/setup.log
apt-get install -y python3-pip jq
pip3 install faker

if [ "${PRODUCT}" == "VirtualBox" ]; then
       echo "Running in template, doing no further setup"
       exit 0
fi

. ${LAB_FOLDER}/setup.sh
. ${LAB_FOLDER}/scripts/assign_ips.sh
. ${LAB_FOLDER}/scripts/web.sh
. /root/labs/ci-modular-target-checks/setup.sh
echo "Finish bootstrap" >> /root/running/setup.log
exit 0
