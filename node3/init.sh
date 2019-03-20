#!/bin/bash
set -u
set -e

echo "[*] Cleaning up temporary data directories"
rm -rf qdata
mkdir -p qdata/logs

echo "[*] Configuring node 2"
mkdir -p qdata/dd2/keystore
cp keys/key2 qdata/dd2/keystore
geth --datadir qdata/dd2 init genesis.json
