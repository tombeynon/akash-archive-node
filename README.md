# Akash Archive Node

Example of how to run an Akash node as per [the documentation](https://docs.akash.network/guides/node). 

Due to the Akash mainnet-2 upgrade, you need to download the blockchain from a snapshot or with statesync, otherwise it errors at block 968. We use this [snapshot service](https://github.com/c29r3/cosmos-snapshots) thanks to @c29r3 to do this as part of the boot.sh entrypoint.

This will be replaced by [ovrclk/cosmos-omnibus](https://github.com/ovrclk/cosmos-omnibus) ASAP and is just an example of how to run the node on Akash and install the snapshot.
