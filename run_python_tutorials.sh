#!/bin/bash

. lib/ansi.sh
. config.sh


export YAGNA_APPKEY=`yagna app-key list --json | jq -r '.values' | jq -r '.[0]' |jq -r '.[1]'`
export YAGNA_ADDR=`yagna app-key list --json | jq -r '.values' | jq -r '.[0]' |jq -r '.[2]'`


source ~/.envs/yagna-python-tutorial/bin/activate
cd ~/test_run/yapapi/


# Blender
echo
ansi::heading "$star * Running QuickPrimer tutorial" 80 "$star"
cd ..
git clone https://github.com/golemfactory/auto_exe.git
cp auto_exe/test_apps/* ~/test_run/yapapi/examples/blender/

cd ~/test_run/yapapi/examples/blender
python3 ./blender-normal-8x.py --subnet-tag devnet-alpha.4

# Yacat
#echo
#ansi::heading "$star * Running Yacat tutorial" 80 "$star"
#cd ../yacat
#python3 yacat.py '?a?a?a?a' '$H$5ZDzPE45C.e3TjJ2Qi58Aaozha6cs30' --subnet-tag community.3 --number-of-providers 3


# VIM
#echo
#ansi::heading "$star * VIM community example" 80 "$star"

#cd ..
#git clone https://github.com/canokaue/gvm-vim
#cd gvm-vim
#python3 ./vim-gvm.py --subnet-tag community.3


echo
ansi::heading "$star * Hints" 80 "$star"


# HINTS ON HOW TO RUN TESTS
echo
echo
echo "To continue running tests execute the following:"
echo "./run_python_tutorials.sh"

echo
echo "You can access your L1 address on etherscan here:"
echo "	--> https://rinkeby.etherscan.io/address/$YAGNA_ADDR"
echo "You can access your L2 funds on zkSync here:"
echo "	--> https://rinkeby.zkscan.io/explorer/accounts/$YAGNA_ADDR"


