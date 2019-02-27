#!/bin/bash
set -u
set -e

GLOBAL_ARGS="--raft --rpc --rpcaddr 0.0.0.0 --rpcapi admin,db,eth,debug,miner,net,shh,txpool,personal,web3,quorum --emitcheckpoints"

echo "[*] Starting Constellation nodes"
nohup constellation-node tm1.conf 2>> qdata/logs/constellation1.log &

sleep 30

echo "[*] Starting node 1"
PRIVATE_CONFIG=tm1.conf nohup geth --datadir qdata/dd1 $GLOBAL_ARGS --raftport 50401 --rpcport 22000 --port 21000 --unlock 0 --password passwords.txt 2>>qdata/logs/1.log &

echo "[*] Waiting for nodes to start"
sleep 30
echo "[*] Sending first transaction"
PRIVATE_CONFIG=tm1.conf geth --exec 'loadScript("script1.js")' attach ipc:qdata/dd1/geth.ipc

echo "Node configured. See 'qdata/logs' for logs, and run e.g. 'geth attach qdata/dd1/geth.ipc' to attach to the Geth node"
