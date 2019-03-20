#!/bin/bash

set -u
set -e

echo "[*] Installing Build Dependencies..."
sudo add-apt-repository -y ppa:ethereum/ethereum
sudo apt-get update
sudo apt-get install -y build-essential unzip libleveldb-dev libdb-dev libsodium-dev zlib1g-dev libtinfo-dev libboost-all-dev libssl-dev libgmp3-dev solc sysvbanner wrk
echo "[*] Installed Build Dependencies"

echo "[*] Copying the pre-compiled binaries to /usr/local/bin..."
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/abigen && chmod +x abigen &&  sudo mv abigen /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/bootnode && chmod +x bootnode && sudo mv bootnode /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/constellation-enclave-keygen && chmod +x constellation-enclave-keygen  && sudo mv constellation-enclave-keygen /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/constellation-node && chmod +x constellation-node && sudo mv constellation-node /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/evm && chmod +x evm && sudo mv evm /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/faucet && chmod +x faucet && sudo mv faucet /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/geth && chmod +x geth && sudo mv geth /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/puppeth && chmod +x puppeth && sudo mv puppeth /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/rlpdump && chmod +x rlpdump && sudo mv rlpdump /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/swarm && chmod +x swarm && sudo mv swarm /usr/local/bin
wget https://github.com/9thGear/zsl-deploy/releases/download/binaries-v0.1.6/wnode && chmod +x wnode && sudo mv wnode /usr/local/bin
echo "[*] Copied the pre-compiled binaries"

echo "[*] Getting the Quorum ZSL Parameters..."
wget https://github.com/9thGear/zsl-deploy/releases/download/parameters-v0.3/shielding.pk && mv ./shielding.pk ./node3
wget https://github.com/9thGear/zsl-deploy/releases/download/parameters-v0.3/shielding.vk && mv ./shielding.vk ./node3
wget https://github.com/9thGear/zsl-deploy/releases/download/parameters-v0.3/transfer.pk && mv ./transfer.pk ./node3
wget https://github.com/9thGear/zsl-deploy/releases/download/parameters-v0.3/transfer.vk && mv transfer.vk ./node3
wget https://github.com/9thGear/zsl-deploy/releases/download/parameters-v0.3/unshielding.pk && mv ./unshielding.pk ./node3
wget https://github.com/9thGear/zsl-deploy/releases/download/parameters-v0.3/unshielding.vk && mv ./unshielding.vk ./node3
echo "[*] Got the Quorum ZSL Parameters"

echo "[*] SETUP SCRIPT COMPLETED"
