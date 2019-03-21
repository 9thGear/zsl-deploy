#!/bin/bash
set -u
set -e

GLOBAL_ARGS="--raft --rpc --rpcaddr 0.0.0.0 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum --emitcheckpoints"

echo "[*] Starting Constellation node..."
nohup constellation-node tm4.conf 2>> qdata/logs/constellation4.log &

sleep 30

echo "[*] Constellation node should be up"

echo "[*] Starting Geth node..."
PRIVATE_CONFIG=tm4.conf nohup geth --datadir qdata/dd4 $GLOBAL_ARGS --raftjoinexisting 4 --raftport 50401 --rpcport 22000 --port 21000 --unlock 0 --password passwords.txt 2>>qdata/logs/4.log &

sleep 30

echo "[*] Geth node should be up..."

echo "Node configured. See 'qdata/logs' for logs, and run e.g. 'geth attach qdata/dd4/geth.ipc' to attach to the Geth node"
