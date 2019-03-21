#!/bin/bash
set -u
set -e

echo "[*] Cleaning up temporary data directories"
rm -rf qdata
mkdir -p qdata/logs

echo "[*] Configuring node 5..."
mkdir -p qdata/dd5/{keystore,geth}
cp raft/static-nodes.json qdata/dd5
cp keys/key5 qdata/dd5/keystore
cp raft/nodekey5 qdata/dd5/geth/nodekey
geth --datadir qdata/dd5 init genesis.json
echo "[*] Configured node 5"
