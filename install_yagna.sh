#!/bin/bash

. lib/ansi.sh
. config.sh



mkdir ~/test_run
cd ~/test_run

echo
ansi::heading "$star * Installing Yagna" 80 "$star"

curl -sSf https://join.golem.network/as-requestor | bash -
yagna --version


# Init Yagna
echo
ansi::heading "$star * Initialising Yagna Daemon" 80 "$star"
yagna service run >> ~/yagna.logs 2>&1 &
echo "Starting up Yagna. Waiting 10 seconds to initialise."
sleep 10

# Requesting and awaiting funds from the zksync faucet (45 seconds)
echo "Requesting funds on zksync, this can take while"
yagna payment fund
echo "Initialising account as sender"
yagna payment init --sender



# Yagna Identity
echo
ansi::heading "$star * Creating Yagna identity.." 80 "$star"
yagna app-key create requestor
echo "Yagna Key: "
yagna app-key list

# Checking for payments status, do we have founds?
echo
ansi::heading "$star * Initialising Yagna Daemon" 80 "$star"
yagna payment status --network rinkeby --driver zksync 







