#!/bin/bash

. lib/ansi.sh
. config.sh



# PIP, etc
echo
ansi::heading "$star * Creating Yagna Python ENV, installing packages" 80 "$star"
cd ~/test_run


python3 -m venv ~/.envs/yagna-python-tutorial
source ~/.envs/yagna-python-tutorial/bin/activate


pip3 install -U pip
pip3 install --extra-index-url https://test.pypi.org/simple/ yapapi==$YAPAPI_VERSION certifi


# YAPAPI CLONE
echo
ansi::heading "$star * Cloning YAPAPI for examples" 80 "$star"

git clone https://github.com/golemfactory/yapapi.git
cd yapapi
git checkout b0.4




# Vars
export YAGNA_APPKEY=`yagna app-key list --json | jq -r '.values' | jq -r '.[0]' |jq -r '.[1]'`
export YAGNA_ADDR=`yagna app-key list --json | jq -r '.values' | jq -r '.[0]' |jq -r '.[2]'`
echo
ansi::heading "$star * Setting local variables" 80 "$star"
echo "YAGNA_APPKEY: $YAGNA_APPKEY"
echo "YAGNA_ADDR: $YAGNA_ADDR"



