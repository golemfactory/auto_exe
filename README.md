# Installing and running Yagna Tutorials


### Disclaimer

Some of these scripts will kill your yagna process, erase all it's settings and dbs, and purge all yagna folders. If you have a separate install of yagna on your machine, please do not use this script.

If you have never install yagna, and this is when you want to start - you're more than welcome to use it!

## Prerequisites

You're going to need 
* jq
and
* python3-venv 

```brew install jq or apt-get jq python3-venv```


## Fetch this repo

```git clone https://github.com/golemfactory/install_and_run.git```

``` cd install_and_run```


# Go through everything
To install all pre-reqs, set up yagna, run everything needed, and run tutorials:


```./run_all.sh```


# Or you can go step by step

## Clean Up from all previous runs, 

This script is going to kill yagna process, erase all it's settings and dbs, and clean all folders. New run will create new identity and new keys.

This is where "run_all.sh" starts

```./clean.sh```

## Install and run Yagna, initialise, request funds from faucet
```./install_yagna.sh```


## Setup Python Tutorials
```./setup_python_tutorials.sh```



## Run Python Tutorials
```./run_python_tutorials.sh```





