- [Which networks can a node connect to](#which-networks-can-a-node-connect-to)
- [REST API of nodes in different networks](#rest-api-of-nodes-in-different-networks)


## Which networks can a node connect to ##

In the lesson, [Waves networks, their types, and application](), we covered the topic of different types of Waves networks.  
Let's recap what we have learned about them and extend our understanding of their abilities.
  
For every node owner, the Waves team offers four different network options:
1. **<u>Mainnet network</u>**  
    The Mainnet network is the main network, where the WAVES tokens have a real value on the market.  
    You can use the [Waves Exchange](https://waves.exchange/) wallet for cryptocurrency transfers, which will be operating in the Mainnet network.  
    If you have a goal to generate a block a receive a real reward, you are also making it within the Mainnet network.  
    You can [develop smart contracts]() in the [Waves IDE](https://waves-ide.com/) within Mainnet.  
    The name of the network describes its purposes, this is the main network of the Waves.  
2. **<u>Testnet network</u>**  
    The Testnet network is an identical copy of the Mainnet, yet, without real value of its tokens on the market.  
    If your goal is to get used to the way the Waves blockchain works without necessity of using real funds, feel free to connect to the Testnet network.
    The same very tools as in the Mainnet network would be available, and additionally, you can top up the balance for free via [Faucet](https://testnet.wavesexplorer.com/faucet).
3. **<u>Stagenet network</u>**  
    The Stagenet network is the experimental network.  
    The Waves developers community cannot publish all developed features directly to Mainnet without testing.  
    Within this network, every feature is being throughouly tested before it actually appears on Mainnet.  
    If you wish to get a taste of new features before they are available to everyone, the Stagenet network is the correct place.  
    You can participate in discussions with developers regarding experimental Stagenet functionalities in the [Discord Waves Tech channel](https://discord.com/invite/3g8XR6B).  
    In case you have any questions, we recommend you to address them in the channel.
4. **<u>Custom network</u>**  

Different networks cannot "communicate" with each other.  
An account created within the Stagenet would not exist in the Testnet.  
Transfering tokens from custom network or Testnet to Mainnet would not be possible.  
Inter-network communication is not possible.  
  
We would like to remind you of the [Waves Explorer](https://new.wavesexplorer.com/) tool, where you can browse any blockchain data in all given networks.

---

## REST API of nodes in different networks ##

In this series of lessons regarding node deployment, we installed a node within the Mainnet network and made it ready for mining.  
Yet, you can deploy a node in any of the neworks: Mainnet, Testnet, Stagenet or your custom blockchain network.  

After your node is deployed, you can use the REST API Swagger user interface service:
- **<u>Mainnet</u>**: https://nodes.wavesnodes.com
- **<u>Testnet</u>**: https://nodes-testnet.wavesnodes.com
- **<u>Stagenet</u>**: https://nodes-stagenet.wavesnodes.com
- **<u>Custom network</u>**: By default, it is available by the address http://localhost:6869

The swagger user interface allows you to interact with your node.  
There you may send requests for fetching, posting or deleting data with a few clicks.  

In case you are using Mainnet, Testnet or Stagenet networks REST API, you may face certain limitations in frequency of invoking methods.  
Here you can see an example of [requests limitatioms for Mainnet](https://docs.waves.tech/en/waves-node/api-limitations-of-the-pool-of-public-nodes#limitations-on-mainnet-pool).    
Please, note that in the table avaialble by link regular expressions are used to define paths, for example, `\d+`.


