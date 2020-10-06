#!/bin/bash


mkdir ~/test_run
cd ~/test_run
python3 --version
curl -sSf https://join.golem.network/as-requestor | bash -
yagna --version
yagna service run > yagna.logs 2>&1 &
echo "Waiting 10 seconds for yagna to initialise"
sleep 10

# TUTORIAL STEPS

yagna app-key create requestor
yagna app-key list
yagna payment init -r
yagna payment status




