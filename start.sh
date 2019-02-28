#!/bin/bash

set -u
set -e

echo "[*] Running raft-init.sh..."
./node1/raft-init.sh
ehco "[*] raft-init.sh Finsihed"

echo "[*] Running raft-start.sh"
./node1/raft-start.sh
echo "[*] raft-start.sh Finished"

