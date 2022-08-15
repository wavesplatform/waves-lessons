## Network description ##

A network is a way of connecting different hosts into one space.  
At home, we may have different devices connected to one WI-FI router, forming a net.  
All of those devices would be considered members of the home network.

![](./img/network.jpeg?raw=true)

Likewise, the Waves network has a space where independent [nodes]() are connected to one network.  
This space allows all the nodes to be connected, forming conditions for [decentralization]().  

## Mainnet, Testnet, Stagenet ##

In our platform, there are three different networks within the Waves blockchain.  
All of the nodes are united within a network they are connected to:

- **<u>Mainnet</u>**:  
  The primary Waves network where tokens have real value.   
  Block generators and lessors receive rewards for block generation and leasing, respectively.  
  You can also check some statistics regarding the nodes launched on Mainnet [here](https://new.wavesexplorer.com/nodes).
- **<u>Testnet</u>**:  
  The network is intended for testing purposes.  
  Testnet is a clone of Mainnet, yet it is a testing environment.  
  No real funds are necessary, and it is possible to generate free WAVES tokens.  
  Check out the [Faucet](https://testnet.wavesexplorer.com/faucet) to top up the account balance on Testnet.
- **<u>Stagenet</u>**:  
  The experimental network.  
  All new features are first tested on Stagenet before being deployed to Mainnet and Testnet.  
  If you want to be the first to test experimental features, Stagenet is the correct place.  
  Check out the [Faucet](https://stagenet.wavesexplorer.com/faucet) to top up the account balance on Stagenet.  


All the networks have their chain ID.  
Chain ID is a symbol that differentiates one network from another.  
This chain ID is used in account address formation, making inter-network operations impossible.  
It will not be possible to use the same address account in different networks or transfer funds from one network to another.

| Network Name | Chain ID|
| ------ | ------ |
| Mainnet | W or 87 (ASCII code of W) |
| Testnet | T or 84 (ASCII code of T) |
| Stagenet | S or 83 (ASCII code of S) |

Also, you may create your custom network.  
See more about [Custom blockchain](https://docs.waves.tech/en/waves-node/private-waves-network#deploy-node-with-custom-blockchain-in-docker).  

You may launch your node in any of these networks, depending on the goal.  
You can read more about it in the [Mining and earning on it]() chapter.  

## Useful network resources ##

Since Waves has a developed infrastructure, it has many different tools that function with the networks mentioned above.  
In the lesson [Waves infrastructure products and tools](), all of them will be explained in detail.

Nevertheless, there are two services that it is worth mentioning:
- [Waves Explorer](#waves-explorer)
- [Swagger API](#network-api)

### Waves explorer ###

[Waves Explorer](https://new.wavesexplorer.com/) is a service that allows browsing the Waves blockchain data.  
For example, if we made a money transfer to our friend, such a transaction can be checked via Waves Explorer.

![](./img/waves_transfer.png?raw=true)

Kindly note that selecting the correct network when browsing any blockchain data is very important.  
No data will appear if any transaction is made in one network while the search was done within another.  
The network can be changed in the right corner of the screen on the [site](https://new.wavesexplorer.com).

![](./img/network_selection.png?raw=true)

The topic of the Waves Explorer will be covered in the [Infrastructure products and tools]() chapter.  

### Network API ###

With the API service, it is possible to interact with the blockchain.  
There are three different APIs with each of the networks.  
All of them are accessible via the Swagger User Interface:

- [Mainnet](https://nodes.wavesnodes.com/api-docs/index.html)
- [Testnet](https://nodes-testnet.wavesnodes.com/api-docs/index.html)
- [Stagenet](https://nodes-stagenet.wavesnodes.com/api-docs/index.html)

Please, note that depending on the load of all the nodes, the Swagger tool connects you automatically to a random official Waves node that is not overloaded.  
Therefore, different nodes’ APIs may be opened in the Swagger interface at different times.  

Using the API, it is possible to fetch some data from the blockchain or make an action on it.  
For example, we may click [/node/version](https://nodes.wavesnodes.com/api-docs/index.html#/node/getNodeVersion) to get the current Waves node version.

![](./img/api_response.png?raw=true)
  
The API features will be explained in more detail in the [Infrastructure products and tools]() chapter.  
  
The next lesson’s topic will be [smart assets and how to create one]().  