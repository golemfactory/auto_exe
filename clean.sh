#!/bin/bash

# PREREQS
# You're going to need jq installed
# brew install jq or apt-get jq python3-venv

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
rm -rf ~/test_run 
killall yagna
# Remove Python env

rm -rf ~/.envs/yagna-python-tutorial


