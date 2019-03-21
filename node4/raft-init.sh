#!/bin/bash
set -u
set -e

echo "[*] Cleaning up temporary data directories"
rm -rf qdata
mkdir -p qdata/logs

echo "[*] Configuring node 4..."
mkdir -p qdata/dd4/{keystore,geth}
cp raft/static-nodes.json qdata/dd4
cp keys/key4 qdata/dd4/keystore
cp raft/nodekey4 qdata/dd4/geth/nodekey
geth --datadir qdata/dd4 init genesis.json
echo "[*] Configured node 4"
