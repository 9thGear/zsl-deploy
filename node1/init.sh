#!/bin/bash
set -u
set -e

echo "[*] Cleaning up temporary data directories"
rm -rf qdata
mkdir -p qdata/logs

echo "[*] Configuring node 1"
mkdir -p qdata/dd1/keystore
cp keys/key1 qdata/dd1/keystore
geth --datadir qdata/dd1 init genesis.json
