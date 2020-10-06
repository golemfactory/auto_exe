#!/bin/bash

# PREREQS
# You're going to need jq installed
# brew install jq or apt-get install jq

_ostype="$(uname -s)"



# CLEANUPS

# Remove last install of yagna


if [ "$_ostype" = "Darwin" ]; then
	rm -rf $HOME/Library/Application\ Support/GolemFactory.yagna
fi

if [ "$_ostype" = "Linux" ]; then
	rm -rf $HOME/.local/share/yagna 
fi

# Remove last install of blender and env
rm -rf test_run || true
killall yagna
# Remove Python env

rm -rf ~/.envs/yagna-python-tutorial

mkdir test_run
cd test_run
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

echo "To continue running tests execute the following:"
echo "cd test_run/yapapi/examples/blender/"
echo "export YAGNA_APPKEY=$YAGNA_APPKEY"
echo "source ~/.envs/yagna-python-tutorial/bin/activate"
echo "python3 ./blender.py --subnet-tag devnet-alpha.2"
echo
echo "You can access your rinkeby address on etherscan here:"
echo "https://rinkeby.etherscan.io/address/$YAGNA_ADDR"


And after experiments

echo "deactivate"
echo "cd ../../../"


