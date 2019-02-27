#!/bin/bash

set -u
set -e

ZSL_DEPLOY_BRANCH = "minimal-node-setup"

while getopts ":b:" opt; do
  case $opt in
    b)
      echo "Will try to pull down zsl-deploy branch: $OPTARG" >&2
      ZSL_DEPLOY_BRANCH = $OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires a branch name" >&2
      exit 1
      ;;
  esac
done

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

echo "[*] Cloning the zsl-deploy branch: $ZSL_DEPLOY_BRANCH..."
{ # try
    git clone -b $ZSL_DEPLOY_BRANCH --single-branch https://github.com/9thGear/zsl-deploy.git && cd zsl-deploy
    echo "[*] Cloned the zsl-deploy branch: $ZSL_DEPLOY_BRANCH"
} || { # catch
    git clone -b minimal-node-setup --single-branch https://github.com/9thGear/zsl-deploy.git && cd zsl-deploy
    echo "[*] Defaulted to cloning the zsl-deploy branch: minimal-node-setup"
}

echo "[*] Getting the Quorum ZSL Parameters..."
wget https://github.com/jpmorganchase/zsl-q-params/releases/download/v0.3/shielding.pk
wget https://github.com/jpmorganchase/zsl-q-params/releases/download/v0.3/shielding.vk 
wget https://github.com/jpmorganchase/zsl-q-params/releases/download/v0.3/transfer.pk
wget https://github.com/jpmorganchase/zsl-q-params/releases/download/v0.3/transfer.vk 
wget https://github.com/jpmorganchase/zsl-q-params/releases/download/v0.3/unshielding.pk
wget https://github.com/jpmorganchase/zsl-q-params/releases/download/v0.3/unshielding.vk
echo "[*] Got the Quorum ZSL Parameters"

echo "[*] SETUP SCRIPT COMPLETED"
