#!/bin/bash

set -u
set -e

cd ./node1

echo "[*] Running raft-init.sh..."
./raft-init.sh
echo "[*] raft-init.sh Finsihed"

echo "[*] Running raft-start.sh"
./raft-start.sh
echo "[*] raft-start.sh Finished"

