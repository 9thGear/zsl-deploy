# 7Node Node 2 Setup

The [node](https://github.com/9thGear/zsl-deploy/tree/7node-1-setup/node1) directory contains all the needed files to setup Node 2 in [Quorum's ZSL 7Node example](https://github.com/jpmorganchase/quorum-examples/tree/zsl_geth1.6/examples/7nodes)

## Table of Content

- [Getting Started](#getting-started)
- [Before Starting Node 2](#before-starting-node-2)
- [Starting Node 2](#starting-node-2)

## Getting Started

1. Clone this branch to an Ubuntu 16.04 machine with:

```bash
git clone -b 7node-2-setup --single-branch https://github.com/9thGear/zsl-deploy.git
```

2. `cd` into the project directory: `cd zsl-deploy`

3. Run the `init.sh` script:

```bash
./init.sh
```

4. Update `static-nodes.json` File to Use Node 1's IP Address

Update `["enode://...@127.0.0.1:2100..."]` to use node 1's IP address instead of `127.0.0.1`

5. Update `tm2.conf` File to Use the Node's IP Address and Node 1's IP Address

`vim ./node2/tm2.conf`

Update line 2: `url = "http://127.0.0.1:9000/"` to use your node's IP address instead of `127.0.0.1`

Update line 14: `otherNodeUrls = ["http://127.0.0.1:9000/"]` to user node 1's IP address instead of `127.0.0.1`

This will install the needed packages, [precompiled-binaries](https://github.com/9thGear/zsl-deploy/releases/tag/binaries-v0.1.6), and [Quorum ZSL Parameters](https://github.com/jpmorganchase/zsl-q-params/releases/tag/v0.3)

## Before Starting Node 2

You will need to access the Geth JavaScript console on Node 1 in order to add Node 2's `enodeId` to the network

1. **On Node 2**, run the following command to generate Node 2's `enodeId` and then copy the output to your clipboard: `bootnode --nodekey=node2/raft/nodekey2 --writeaddress`

2. **On Node 1**, connect to the Geth JavaScript console using: `geth attach node1/qdata/dd1/geth.ipc`

3. Once you have a prompt, type: `raft.addPeer("enode://<enodeId>@<ip>:21000?discport=0&raftport=50401")` make sure to replace `<enodeId>` with the `enodeId` you just copied (node 2's `enodeId`), and replace `<ip>` with the IP address of node 2

After executing `raft.addPeer()` a number 2 should have been returned to you - this is the `raftId` of node 2

## Starting Node 2

1. Run the `start.sh` script:

```bash
./start.sh
```

