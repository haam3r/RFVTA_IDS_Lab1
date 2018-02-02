#!/bin/bash
# Bootstrap script for VTA

LAB_FOLDER="/root/labs/RF_IDS_Lab1_Scripts"

cd ${LAB_FOLDER}
git pull

apt-get install python3-pip
pip3 -U install faker

/root/labs/RF_IDS_Lab1_Scripts/setup.sh
