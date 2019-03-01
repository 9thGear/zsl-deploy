# 7Node Node 2 Setup

The [node](https://github.com/9thGear/zsl-deploy/tree/7node-1-setup/node1) directory contains all the needed files to setup Node 2 in [Quorum's ZSL 7Node example](https://github.com/jpmorganchase/quorum-examples/tree/zsl_geth1.6/examples/7nodes)

## Table of Content

- [Getting Started](#getting-started)
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

This will install the needed packages, [precompiled-binaries](https://github.com/9thGear/zsl-deploy/releases/tag/binaries-v0.1.6), and [Quorum ZSL Parameters](https://github.com/jpmorganchase/zsl-q-params/releases/tag/v0.3)

## Starting Node 2

1. Run the `start.sh` script:

```bash
./start.sh
```

