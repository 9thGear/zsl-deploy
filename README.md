# Minimal Node Setup

This is a template directory for setting up a Quorum ZSL node using the RAFT consensus mechanism

There are still a few requirements needed in order to boot a node using this template, such as:

- Updating `genesis.json`
- Generating keys
- Updating `passwords.txt`
- Updating `static-nodes.json`
- Updating `tm.conf`

## Table of Contents

- [Getting Started](#getting-started)
- [Updating `genesis` JSON file](#updating-genesis-json-file)
- [Generating Keys](#generating-keys)
- [Updating `password` TXT file](#updating-password-txt-file)
- [Updating `static-nodes` JSON file](#updating-static-nodes-json-file)
- [Updating `tm` CONF file](#updating-tm-conf-file)

## Getting Started

1. Clone this branch to an Ubuntu 16.04 machine with:

```bash
git clone -b minimal-node-setup --single-branch https://github.com/9thGear/zsl-deploy.git
```

2. Run the `init.sh` script:

```bash
chmod +x init.sh && ./init.sh
```

This will install the needed packages, [precompiled-binaries](https://github.com/9thGear/zsl-deploy/releases/tag/binaries-v0.1.6), and [Quorum ZSL Parameters](https://github.com/jpmorganchase/zsl-q-params/releases/tag/v0.3)

## Updating `genesis` JSON file

TBD

## Generating Keys

TBD

## Updating `password` TXT file

TBD

## Updating `static-nodes` JSON file

TBD

## Updating `tm` CONF file

TBD
