- [Which networks can a node connect to](#which-networks-can-a-node-connect-to)
- [REST API of nodes in different networks](#rest-api-of-nodes-in-different-networks)

## Which networks can a node connect to ##

In the lesson, [Waves networks, their types, and application](), we covered the topic of different kinds of Waves networks.  
Let's recap what we have learned about them and extend our understanding of their abilities.
  
For every node owner, the Waves team offers four different network options:
1. **<u>Mainnet network</u>**  
    The Mainnet network is the main network where the WAVES tokens have a real value on the market.  
    You can use the [Waves Exchange](https://waves.exchange/) wallet for cryptocurrency transfers, which will operate in the Mainnet network.  
    If you have a goal to generate a block and receive a real reward, you also make it within the Mainnet network.  
    You can [develop smart contracts]() in the [Waves IDE](https://waves-ide.com/) within Mainnet.  
    The network’s name describes its purposes, which is the Waves’ main network.  
2. **<u>Testnet network</u>**  
    The Testnet network is an identical copy of the Mainnet, yet, without the actual value of its tokens on the market.  
    If your goal is to get used to the way the Waves blockchain works without the necessity of using real funds, feel free to connect to the Testnet network.  
    The same tools as in the Mainnet network would be available, and additionally, you can top up the balance for free via [Faucet](https://testnet.wavesexplorer.com/faucet).
3. **<u>Stagenet network</u>**  
    The Stagenet network is the experimental network.  
    Without testing, the Waves developers community cannot publish all developed features directly to Mainnet.  
    Every feature is thoroughly tested within this network before appearing on Mainnet.  
    If you wish to get a taste of new features before they are available to everyone, the Stagenet network is the correct place.  
    You can participate in discussions with developers regarding experimental Stagenet functionalities in the [Discord Waves Tech channel](https://discord.com/invite/3g8XR6B).  
    If you have any questions, we recommend you address them in the channel.
4. **<u>Custom network</u>**  
    A custom network is a way to create your blockchain based on the Waves blockchain.  
    With it, you can create a private project or promote your blockchain.  
    Usage variety would ultimately depend on the developer's ingenuity.

Different networks cannot "communicate" with each other.  
An account created within the Stagenet would not exist in the Testnet.  
Transferring tokens from a custom network or Testnet to Mainnet would not be possible.  
Inter-network communication is not possible.  
  
We want to remind you of the [Waves Explorer](https://new.wavesexplorer.com/) tool, where you can browse any blockchain data in all networks.

---

## REST API of nodes in different networks ##

In this series of lessons regarding node deployment, we installed a node within the Mainnet network and made it ready for mining.  
Yet, you can deploy a node in any network: Mainnet, Testnet, Stagenet, or your custom blockchain network.  

After your node is deployed, you can use the REST API Swagger user interface service:
- **<u>Mainnet</u>**: https://nodes.wavesnodes.com
- **<u>Testnet</u>**: https://nodes-testnet.wavesnodes.com
- **<u>Stagenet</u>**: https://nodes-stagenet.wavesnodes.com
- **<u>Custom network</u>**: By default, it is available by the address http://localhost:6869

The swagger user interface allows you to interact with your node.  
You may send requests for fetching, posting, or deleting data with a few clicks.  

If you are using Mainnet, Testnet, or Stagenet networks REST API, you may face certain limitations in the frequency of invoking methods.  
Here you can see an example of [requests limitations for Mainnet](https://docs.waves.tech/en/waves-node/api-limitations-of-the-pool-of-public-nodes#limitations-on-mainnet-pool).    
Please, note that in the table available by the link, regular expressions are used to define paths, for example, `\d+`.

