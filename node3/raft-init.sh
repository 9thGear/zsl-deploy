#!/bin/bash
set -u
set -e

echo "[*] Cleaning up temporary data directories"
rm -rf qdata
mkdir -p qdata/logs

echo "[*] Configuring node 3..."
mkdir -p qdata/dd3/{keystore,geth}
cp raft/static-nodes.json qdata/dd3
cp keys/key3 qdata/dd3/keystore
cp raft/nodekey3 qdata/dd3/geth/nodekey
geth --datadir qdata/dd3 init genesis.json
echo "[*] Configured node 3"
