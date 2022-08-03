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

Depending on your operating system, there are different ways of node deployment.  
For every OS, there will be 2 ways of node installation:
- Docker container;
- Package installation.

Please, select your OS to find out how to deploy a node with it:  
- [Ubuntu]()
- [MacOS]()
- [Windows]()