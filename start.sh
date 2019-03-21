#!/bin/bash

set -u
set -e

cd ./node5

echo "[*] Running raft-init.sh..."
./raft-init.sh
echo "[*] raft-init.sh Finished"

echo "[*] Running raft-start.sh"
./raft-start.sh
echo "[*] raft-start.sh Finished"

