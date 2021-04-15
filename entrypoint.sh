#!/bin/bash

export AKASH_HOME="${PWD?}"
export AKASH_NET="https://raw.githubusercontent.com/ovrclk/net/master/$AKASH_NETWORK"
export AKASH_VERSION="$(curl -s "$AKASH_NET/version.txt")"
export AKASH_CHAIN_ID="$(curl -s "$AKASH_NET/chain-id.txt")"
export AKASH_SEEDS="$(curl -s "$AKASH_NET/seed-nodes.txt" | paste -sd "," - | tr ',' '\,')"

akash init --chain-id "$AKASH_CHAIN_ID" "$AKASH_MONIKER"

sed -i s/\$MONIKER/$AKASH_MONIKER/g $AKASH_HOME/config/config.toml
sed -i "s/\$SEEDS/$AKASH_SEEDS/g" $AKASH_HOME/config/config.toml

curl -s "$AKASH_NET/genesis.json" > $AKASH_HOME/config/genesis.json

akash validate-genesis

if [ $BOOTSTRAP == "1" ]
then
  rm -rf ~/.akash/data;
  mkdir -p ~/.akash/data;
  cd ~/.akash/data
  SNAP_NAME=$(curl -s http://135.181.60.250/akash/ | egrep -o ">akashnet-2.*tar" | tr -d ">");
  echo "Downloading snapshot..."
  wget -nv -O - http://135.181.60.250/akash/${SNAP_NAME} | tar xf -
fi

exec "$@"
