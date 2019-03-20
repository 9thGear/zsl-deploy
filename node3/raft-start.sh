#!/bin/bash
set -u
set -e

GLOBAL_ARGS="--raft --rpc --rpcaddr 0.0.0.0 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum --emitcheckpoints"

echo "[*] Starting Constellation node..."
nohup constellation-node tm3.conf 2>> qdata/logs/constellation3.log &

sleep 30

echo "[*] Constellation node should be up"

echo "[*] Starting Geth node..."
PRIVATE_CONFIG=tm3.conf nohup geth --datadir qdata/dd3 $GLOBAL_ARGS --raftjoinexisting 3 --raftport 50401 --rpcport 22000 --port 21000 --unlock 0 --password passwords.txt 2>>qdata/logs/3.log &

sleep 30

echo "[*] Geth node should be up..."

echo "Node configured. See 'qdata/logs' for logs, and run e.g. 'geth attach qdata/dd3/geth.ipc' to attach to the Geth node"
