# Waves Networks, Their Types, and Application #

 - [Network Description](#network-description)
 - [Mainnet, Testnet, Stagenet](#mainnet-testnet-stagenet)
 - [Useful Network Resources](#useful-network-resources)
   - [Waves Explorer](#waves-explorer)
   - [Network API](#network-api)

---

## Network Description ##

A network is a way of connecting different hosts into one space.<br>
At home, we may have different devices connected to one WI-FI router, forming a net.<br>
All of those devices would be considered members of the home network.<br>

<img width="700px" src="https://cdn.consumidormoderno.com.br/wp-content/uploads/2021/02/market-network.jpg">

Likewise, with the Waves network, there is a space where independent [nodes]() are connected to one network.<br>
This space allows all the nodes to be connected to each other, forming conditions for [decentralization]().<br>

---

## Mainnet, Testnet, Stagenet ##

In our platform, there are 3 different networks within the Waves blockchain.<br>
All of the nodes are united within a network they are connected to:

- **<ins>Mainnet</ins>**:<br>
  The main Waves network where tokens have real value.<br> 
  Block generators and lessors receive rewards for block generation and leasing respectively.<br>
  You can also check some statistics regarding the nodes launched on Mainnet [here](https://new.wavesexplorer.com/nodes).
- **<ins>Testnet</ins>**:<br>
  The network is intended for testing purposes.<br>
  Testnet is a clone of Mainnet, yet it is a testing environment.<br>
  There is no necessity of using real funds, and it is possible to generate free WAVES tokens.<br>
  Check out the [Faucet](https://testnet.wavesexplorer.com/faucet) to top up the account balance on Testnet.
- **<ins>Stagenet</ins>**:<br>
  The experimental network.<br>
  All the new features are firstly tested on Stagenet before being deployed to both Mainnet and Testnet.<br>
  If you would like to be the first one to test experimental features, Stagenet is the correct place.<br>
  Check out the [Faucet](https://stagenet.wavesexplorer.com/faucet) to top up the account balance on Stagenet.<br>


All the networks have their own chain ID.<br>
Chain ID is a symbol that differentiates one network from another.<br>
This chain ID is used in account address formation and makes inter-network operations impossible.<br>
It won't be possible to use the same address account in different networks or transfer funds from one network to another.

| Network Name | Chain ID|
| ------ | ------ |
| Mainnet | W or 87 (ASCII code of W) |
| Testnet | T or 84 (ASCII code of T) |
| Stagenet | S or 83 (ASCII code of S) |

Also, you may create your custom network.<br>
See more about [Custom Blockchain](https://docs.waves.tech/en/waves-node/private-waves-network#deploy-node-with-custom-blockchain-in-docker).<br>

Depending on the goal, you may launch your own node in any of the networks.<br>
Read about it in the [Mining and earning on it]() chapter.<br>

---

## Useful Network Resources ##

Since Waves has a large infrastructure, it has many different tools that function with the aforementioned networks.<br>
In the lesson [Waves Infrastructure Products And Tools](), all of them will be explained in detail.

Nevertheless, there are 2 services that it is worth mentioning:
- [Waves Explorer](#waves-explorer)
- [Swagger API](#network-api)

### Waves Explorer ###

[Waves Explorer](https://new.wavesexplorer.com/) is a service that allows browsing the Waves blockchain data.<br>
For example, if we made a money transfer to our friend, such a transaction can be checked via Waves Explorer.<br>
<br>
![](./images/waves_transfer.png)
<br>
Kindly note that it is very important to select the correct network when browsing any blockchain data.<br>
If any transaction is made in one network, meanwhile the search was made within another, no data will appear.<br>
The network can be changed in the right corner of the screen on the [site](https://new.wavesexplorer.com).<br>
<br>
![](./images/network_selection.png)
<br>
The topic of the Waves Explorer will be covered in the [Infrastructure Products and tools]() chapter.<br>

### Network API ###

With the API service, it is possible to interact with the blockchain.<br>
There are 3 different APIs with each of the networks.<br>
All of them are accessible via the Swagger User Interface:

- [Mainnet](https://nodes.wavesnodes.com/api-docs/index.html)
- [Testnet](https://nodes-testnet.wavesnodes.com/api-docs/index.html)
- [Stagenet](https://nodes-stagenet.wavesnodes.com/api-docs/index.html)

Please, note that depending on the load of all the nodes, the Swagger tool connects you automatically to a random node that isn't overloaded.<br>
Therefore, at different times, different nodes' APIs may be opened in the Swagger interface.<br>

Using the API, it is possible to fetch some data of the blockchain or make an action on it.<br>
For example, we may click [/node/version](https://nodes.wavesnodes.com/api-docs/index.html#/node/getNodeVersion) to get the current Waves node version.<br>
<br>
![](./images/api_response.png)
<br>
The API features will be explained in more detail in the [Infrastructure Products and tools]() chapter.
