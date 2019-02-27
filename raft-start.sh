#!/bin/bash
set -u
set -e

GLOBAL_ARGS="--raft --rpc --rpcaddr 0.0.0.0 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum --emitcheckpoints"

echo "[*] Starting Constellation node..."
nohup constellation-node tm2.conf 2>> qdata/logs/constellation2.log &

sleep 30

echo "[*] Constellation node should be up"

echo "[*] Starting Geth node..."
PRIVATE_CONFIG=tm2.conf nohup geth --datadir qdata/dd2 $GLOBAL_ARGS --raftport 50401 --rpcport 22000 --port 21000 --unlock 0 --password passwords.txt 2>>qdata/logs/2.log &

sleep 30

echo "[*] Geth node should be up..."

echo "Node configured. See 'qdata/logs' for logs, and run e.g. 'geth attach qdata/dd2/geth.ipc' to attach to the Geth node"
