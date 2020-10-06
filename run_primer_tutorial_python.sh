#!/bin/bash

cd ~/test_run
python3 -m venv ~/.envs/yagna-python-tutorial
source ~/.envs/yagna-python-tutorial/bin/activate
pip3 install -U pip
pip3 install certifi
pip3 install -i https://test.pypi.org/simple/ --extra-index-url=https://pypi.org/simple/ yapapi==0.3.0a1.
git clone https://github.com/golemfactory/yapapi.git
cd yapapi
git checkout b0.3
export YAGNA_APPKEY=`yagna app-key list --json | jq -r '.values' | jq -r '.[0]' |jq -r '.[1]'`
export YAGNA_ADDR=`yagna app-key list --json | jq -r '.values' | jq -r '.[0]' |jq -r '.[2]'`

cd examples/blender
python3 ./blender.py --subnet-tag devnet-alpha.2

# HINTS ON HOW TO RUN TESTS
echo
echo
echo "NEXT:"
echo 
echo
echo "To continue running tests execute the following:"
echo "cd test_run/yapapi/examples/blender/"
echo "export YAGNA_APPKEY=$YAGNA_APPKEY"
echo "source ~/.envs/yagna-python-tutorial/bin/activate"
echo "python3 ./blender.py --subnet-tag devnet-alpha.2"
echo
echo "You can access your rinkeby address on etherscan here:"
echo "https://rinkeby.etherscan.io/address/$YAGNA_ADDR"


echo "And after experiments"

echo "deactivate"
echo "cd ../../../"


