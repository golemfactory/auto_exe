#!/bin/bash

. lib/ansi.sh



# PIP, etc
echo
ansi::heading "$star * Creating Yagna Python ENV, installing packages" 80 "$star"
cd ~/test_run


python3 -m venv ~/.envs/yagna-python-tutorial
source ~/.envs/yagna-python-tutorial/bin/activate


pip3 install -U pip
pip3 install --extra-index-url https://test.pypi.org/simple/ yapapi==0.4.0a0 certifi


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



# Blender
echo
ansi::heading "$star * Running QuickPrimer tutorial" 80 "$star"
cd examples/blender
python3 ./blender.py --subnet-tag community.3

# Yacat
#echo
#ansi::heading "$star * Running Yacat tutorial" 80 "$star"
#cd ../yacat
#python3 yacat.py '?a?a?a?a' '$H$5ZDzPE45C.e3TjJ2Qi58Aaozha6cs30' --subnet-tag community.3 --number-of-providers 3


echo
ansi::heading "$star * Hints" 80 "$star"


# HINTS ON HOW TO RUN TESTS
echo
echo
echo "NEXT:"
echo 
echo
echo "To continue running tests execute the following:"
echo "cd ~/test_run/yapapi/examples/blender/"
echo "export YAGNA_APPKEY=$YAGNA_APPKEY"
echo "source ~/.envs/yagna-python-tutorial/bin/activate"
echo "python3 ./blender.py --subnet-tag community.3"
echo
echo "You can access your L1 address on etherscan here:"
echo "https://rinkeby.etherscan.io/address/$YAGNA_ADDR"
echo "You can access your L2 funds on zkSync here:"
echo "https://rinkeby.zkscan.io/explorer/accounts/$YAGNA_ADDR"


echo "After experiments you're done with the experiments:"
echo
echo "deactivate"
echo "cd ../../../"


