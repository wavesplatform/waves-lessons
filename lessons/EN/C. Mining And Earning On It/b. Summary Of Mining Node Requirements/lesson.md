## Prerequisites ##

To have a mining node that would bring you an income, it is necessary to have requirements for both [having a node](#node-requirements) and [block generation](#block-generation-requirements) fulfilled.  
[Node requirments](#node-requirements) are general technical requirements for your computer to deploy a node.  
These requirements would be enough to have a validating node connected to the Waves blockchain network.  
[Block generation requirements](#block-generation-requirements) are the necessary conditions that would enable block generation and getting a reward for it.  

### Node requirements ###

To deploy a node there are no other requirements but the requirements for computer capacity:  

| Minimum Requirements | CPU | RAM | SSD | 
| :---------- | :----------:  | :----------:  | :----------: |
| [Validating node](https://docs.waves.tech/en/blockchain/node/validating-node) | 2 | 4 GB| 100 GB SSD|
| [Generating node](https://docs.waves.tech/en/blockchain/node/mining-node) | 2+ | 4+ GB| 100+ GB SSD|

### Block generation requirements ###

To have a generating node, you need to have the node's account generating balance of at least 1000 WAVES for the last 1000 blocks:    

| Requirement Description | Example|
| :----- | :----- |
| **<u>Generating balance</u>** is the balance of your account that:<br>- Deductes all the funds you leased to some accounts;<br>- Adds all the funds any other accounts leased to your account.<br><br>| For instance, our imaginary balance is 1005 WAVES:<br>- 700 of them were our WAVES;<br>- 200 of them we leased to our friend Alex;<br>- 505 of them we received by our friend Diana in lease.<br><br>700 - 200 + 505 = 1005 WAVES, our generating balance. |
| **<u>Last 1000 blocks</u>** are the last 1000 blocks from the current blockchain height. | Assume the current blockchain height is 3,211,000 blocks.<br>For us, it would be necessary to have the generating balance, starting from when it was the block 3,210,000,<br>up to the current blockchain height, i.e., 3,211,000 blocks. |
  
We can give an example of a node that is ready for mining.  
It can be a laptop with 2+ CPU cores, 4+GB of RAM, and 100+ GB of SSD.   
The generating balance of this account is 1000 WAVES for the last 1000 blocks.  

## Getting started ##

There are five steps to deploy and manage your node:
1. **<u>Node installation</u>**  
    Firstly, we need to install our node.  
    Within this step, all necessary directories and files will be installed on your host.  
    You will deploy your own Waves node with minimum parameters.
2. **<u>Node configuration</u>**  
    Secondly, the installed node needs to be configured.  
    We will work on the configuration file that defines how your node would work.
3. **<u>Blockchain synchronization</u>**  
    After that, it is necessary to synchronize the node with the current blockchain state.  
    A newly installed node does not have all the blockchain data downloaded yet.  
    This step aims to upload the current blockchain data to our node.
4. **<u>Node update</u>**  
    Once you have a fully working node, after a time, you will need to update it.  
    This step will describe all necessary steps of node upgrading.
5. **<u>Node rollback</u>**  
    If your node does not have updates installed timely, it would be necessary to roll back the node.  
    Rolling back your node would revert it to the working state for further synchronization.

It is possible to deploy a node on Ubuntu, macOS, and Windows.  
For every OS, there can be different ways of deployment offered.  
The Waves team suggests using Docker on your OS for a better experience.  
However, you are free to use any of the suggested methods below.  
Please, choose your OS and only one way of node deployment among the following:
- [Ubuntu]:
  - [Docker]()
  - [Deb package]()
  - [The Waves package]()
- [MacOS]:
  - [Docker]()
  - [The Waves package]()
- [Windows]:
  - [Docker]()
  - [The Waves package]()  