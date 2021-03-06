#!/bin/bash
# Bootstrap script for VTA
export LC_ALL=C
echo "Start bootstrap" >> /root/running/setup.log
LAB_FOLDER="/root/labs/RF_IDS_Lab1_Scripts"
CI_TARGET="/root/labs/ci-modular-target"
CI_TARGET_CHECKS="/root/labs/ci-modular-target-checks"
PRODUCT=$(dmidecode -s system-product-name)

cd ${CI_TARGET}
pwd >> /root/running/setup.log
GIT_SSH_COMMAND="ssh -i ~/.ssh/ci-modular-target" git pull >> /root/running/setup.log

cd ${CI_TARGET_CHECKS}
pwd >> /root/running/setup.log
GIT_SSH_COMMAND="ssh -i ~/.ssh/ci-modular-target-checks" git pull >> /root/running/setup.log

cd ${LAB_FOLDER}
pwd >> /root/running/setup.log
git pull >> /root/running/setup.log

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
