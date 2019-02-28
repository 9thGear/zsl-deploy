#!/bin/bash

set -u
set -e

echo "[*] Installing Build Dependencies..."
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install -y build-essential unzip libleveldb-dev libdb-dev libsodium-dev zlib1g-dev libtinfo-dev libboost-all-dev libssl-dev libgmp3-dev solc sysvbanner wrk
echo "[*] Installed Build Dependencies"

echo "[*] Copying the pre-compiled binaries to /usr/local/bin..."
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/abigen && sudo mv abigen /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/bootnode && sudo mv bootnode /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/constellation-enclave-keygen && sudo mv constellation-enclave-keygen /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/constellation-node && sudo mv constellation-node /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/evm && sudo mv evm /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/faucet && sudo mv faucet /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/geth && sudo mv geth /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/puppeth && sudo mv puppeth /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/rlpdump && sudo mv rlpdump /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/swarm && sudo mv swarm /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/wnode && sudo mv wnode /usr/local/bin
echo "[*] Copied the pre-compiled binaries"

echo "[*] Getting the Quorum ZSL Parameters..."
wget https://github.com/9thGear/zsl-q-params/releases/download/parameters-v0.3/shielding.pk
wget https://github.com/9thGear/zsl-q-params/releases/download/parameters-v0.3/shielding.vk 
wget https://github.com/9thGear/zsl-q-params/releases/download/parameters-v0.3/transfer.pk
wget https://github.com/9thGear/zsl-q-params/releases/download/parameters-v0.3/transfer.vk 
wget https://github.com/9thGear/zsl-q-params/releases/download/parameters-v0.3/unshielding.pk
wget https://github.com/9thGear/zsl-q-params/releases/download/parameters-v0.3/unshielding.vk
echo "[*] Got the Quorum ZSL Parameters"

echo "[*] SETUP SCRIPT COMPLETED"
