- [Prerequisites](#prerequisites)
  - [Node requirements](#node-requirements)
  - [Block generation requirements](#block-generation-requirements)
- [Getting started](#getting-started)

---

## Prerequisites ##

To have a mining node that would bring you an income, it is necessary to have requirements for both [having a node](#node-requirements) and [block generation](#block-generation-requirements) fulfilled.  
[Node requirments](#node-requirements) are general technical requirements necessary for your computer to deploy a node.  
These requirements would be enough to have a validating node connected to the Waves blockchain network.  
[Block generation requirements](#block-generation-requirements) are the necessary conditions that would enable block generation and getting a reward for it.  

---

### Node requirements ###

To deploy a node there are no other requirements but the requirements for computer capacity:  

| Minimum Requirements | CPU | RAM | SSD | 
| :---------- | :----------:  | :----------:  | :----------: |
| [Validating Node](https://docs.waves.tech/en/blockchain/node/validating-node) | 2 | 4 GB| 100 GB SSD|
| [Generating Node](https://docs.waves.tech/en/blockchain/node/mining-node) | 2+ | 4+ GB| 100+ GB SSD|

---

### Block generation requirements ###

To have a generating node, you need to have the node's account generating balance at least 1000 WAVES for the last 1000 blocks:    

| Requirement Description | Example|
| :----- | :----- |
| **<ins>Generating balance</ins>** is the balance of your account that:<br>- Deductes all the funds you leased to some accounts;<br>- Adds all the funds any other accounts leased to your account.<br><br>| For instance, our imaginary balance is 1005 WAVES:<br>- 700 of them were our own WAVES;<br>- 200 of them we leased to our friend Alex;<br>- 505 of them we received by our friend Diana in lease.<br><br>700 - 200 + 505 = 1005 WAVES, our generating balance. |
| **<ins>Last 1000 blocks</ins>** is the last 1000 blocks from the current blockchain height. | Let's assume the current blockchain height is 3,211,000 blocks.<br>For us, it would be necessary to have the generating balance, starting from the moment, when it was the block 3,210,000,<br>up to the current blockchain height, i.e. 3,211,000 blocks.
  
Let's give an example of a node that is ready for mining.  
It can be a laptop with a 2+ CPU cores, 4+GB of RAM, and 100+ GB of SSD.   
The generating balance of this account is 1000 WAVES for the last 1000 blocks.  

---

## Getting started ##

There are 5 steps to deploy and manage your node:
1. **<ins>Node installation</ins>**  
    Firstly, we need to install our node.  
    Within this step, all necessary directories and files in them will be installed on your host.  
    You will deploy your own Waves node with minimum parameters.
2. **<ins>Node configuration</ins>**  
    Secondly, the installed node needs to be configured.  
    We will work on the configuration file that defines how your node would work.
3. **<ins>Blockchain synchronization</ins>**  
    After that, it is necessary to synchronize the node with the current blockchain state.  
    A newly installed node doesn't have all the blockchain data downloaded yet.  
    The goal of this step is to upload the current blockchain data to our node.
4. **<ins>Node update</ins>**  
    Once you have a fully working node, after a time, you will need to update it.  
    This step will describe all necessary steps of node upgrading.
5. **<ins>Node rollback</ins>**  
    In case your node doesn't have updates installed timely, it would be necessary to roll back the node.  
    Rolling back your node would revert it to the working state for further synchronization.

It is possible to deploy a node on Ubuntu, MacOS, and Windows.  
For every OS, there can be different ways of deployment offered.  
The Waves team suggests using Docker on your OS for a better experience.  
However, you are free to use any of the suggested methods below.  
Please, choose your OS and only one way of node deployment among the following:
- [Ubuntu]:
  - [docker]()
  - [deb package]()
  - [waves package]()
- [MacOS]:
  - [docker]()
  - [waves package]()
- [Windows]:
  - [docker]()
  - [waves package]()