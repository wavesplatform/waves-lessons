# Waves Infrastructure Products And Tools #

 - [Waves Toolset](#waves-toolset)
   - [Waves Explorer](#waves-explorer)
   - [Signer](#signer)
   - [Waves IDE](#waves-ide)
   - [Node REST API](#node-rest-api)
   - [Software Development Kits](#software-development-kits)
   - [IDE Plugins](#ide-plugins)
 - [Outro](#outro)

---

## Waves Toolset ##

The Waves blockchain platform has many ready solutions for working with the blockchain.<br>
It is presented in a vast variety of tools that help both developers and regular blockchain users.<br>

Below we will run through different tools and discover how they all can give you the best experience of the Waves blockchain interaction.<br> 
There are 6 major instruments that are absolutely free to use:
- **<ins>[Waves Explorer](#waves-explorer)</ins>**<br>
    Online service that allows you to browse the Waves blockchain data.<br>
- **<ins>[Signer]()</ins>**<br>
    A TypeScript/JavaScript library featuring signing and broadcasting transactions on users behalf.<br> 
- **<ins>[Waves IDE](#waves-ide)</ins>**<br>
    Online environment for developing, testing, and deploying [Ride](#ridetopic) smart contracts.
- **<ins>[Node REST API](#node-rest-api)</ins>**<br>
    Main interface for interacting with the Waves blockchain within different [networks](#networktopic).
- **<ins>[Software Development Kits](#software-development-kits)</ins>**<br>
    Libraries intended for creation, signing, broadcasting [transactions](#linktotransactionlesson), and reading data from the Waves blockchain.
- **<ins>[IDE Plugins](#ide-plugins)</ins>**<br>
    
### Waves Explorer ###

If you would like to browse the Waves blockchain data, the [Waves Explorer](https://new.wavesexplorer.com/) is the correct place for that.<br>
Please, keep in mind that all the blockchain data can exist within 3 major [Waves networks (Mainnet, Testnet, and Stagenet)]().<br>
As well, it can be any [custom blockchain network](https://docs.waves.tech/en/waves-node/private-waves-network) you can create.<br>
<br>
All the information you would be able to see on the screen would depend on the chosen network:<br><br>
![](./images/wavesexp_net.png)
<br><br>

The platform has a user-friendly interface that allows you to:
- **<ins>See the Waves blockchain statistics</ins>**:<br>
  ![](./images/wavesexp_stat.png)<br>
  <!-- There will be available details about the current Waves price in the USD equivalent, the amount of completed transactions, the current block height, etc. -->
-  **<ins>Search transactions, accounts, tokens, blocks details</ins>**:
  ![](./images/wavesexp_search.png)<br>
-  **<ins>Get detailed information about [transactions](https://new.wavesexplorer.com/transactions)</ins>**:
  ![](./images/wavesexp_tx.png)<br>
-  **<ins>Get detailed information about [blocks](https://new.wavesexplorer.com/blocks)</ins>**:
  ![](./images/wavesexp_blocks.png)<br>
-  **<ins>Get detailed information about [nodes](https://new.wavesexplorer.com/nodes)</ins>**:
  ![](./images/wavesexp_nodes.png)<br>

Try browsing blockchain data with the Waves Explorer!<br>

### Signer ###

Signer is a tool that grants integration of payments with WAVES in any other service.<br>
The best way to describe how Signer works is to do it with an example.<br>
<br>
Let's imagine that we manage a online pizza delivery.<br>
We don't want to accept any payments except with the WAVES cryptocurrency.<br>
In case we want to receive WAVES to our cryptowallet, we have 2 options:

- Write down the requisites of our wallet and ask a client to transfer tokens there:<br>
    ![](./images/signer_no.png)<br>
- Integrate payment service that would allow clients to pay with a few clicks:<br>
    ![](./images/signer_yes.png)<br>

As we may have guessed, the first option is an outdated method.<br>
It puts our business at risk, as some clients can change their minds to order due to payment complexity.<br>
Secondly, some clients may experience troubles with proving the payment completion.<br>
<br>

The second option is what the Signer is about.<br>
It helps us to integrate payments with WAVES to a platform.<br>
A client will be able to log in to his account and approve the payment right away.<br>

Read more about [Signer](https://docs.waves.tech/en/building-apps/waves-api-and-sdk/client-libraries/signer).

### Waves IDE ###

[Waves IDE](https://waves-ide.com/) is an environment for working with smart contracts written in [Ride](#ridetopic).<br>
Ride is a programming language intended for smart contracts development, testing, and deployment.<br>
In the Waves IDE, you can work with [dApps](#dapptopic), [smart accounts](#smartacctopic), and [smart assets](#smartassettopic).<br>

This is a demonstration of the Waves IDE user interface:
<br><br>
![waves_ide](./images/waveside.png)
<br><br>

It is possible to switch between different networks within the IDE, be it a default network or a custom one.<br><br>
![](./images/waveside_nodes.png)
<br><br>

As well you can check libraries that contain code examples and even a series of short tutorials:<br><br>
![](./images/waveside_libs.png)
<br><br>

Read more about [Waves IDE](https://docs.waves.tech/en/building-apps/smart-contracts/tools/waves-ide).

### Node REST API ###

The Waves node REST API is the main interface for interacting with the Waves blockchain.<br>
The API provides public endpoints and also private endpoints that require authorization using an API key.<br>

The Waves team supports node pools with public API endpoints accessible to anyone:
- [Mainnet](https://nodes.wavesnodes.com)
- [Testnet](https://nodes-testnet.wavesnodes.com)
- [Stagenet](https://nodes-stagenet.wavesnodes.com)

With the help of the Swagger user interface, you can work with:<br>
**<ins>Public methods</ins>**:<br>
  - `Reading blockchain data`: Information about accounts, transactions, tokens, blocks, etc.
  - `Working with transactions`: Broadcasting and validating transactions, checking their statuses.
  - `Working with utilities`: Random seed generation, checking validity of an address, etc. 
<br>

The Waves team does not provide the API key for public nodes.<br>
If you want to use private endpoints, start [your own node](https://docs.waves.tech/en/waves-node/private-waves-network).

**<ins>Private Methods</ins>** (only for node owners):<br>
- `Managing accounts in the node wallet`.
- `Signing transactions`: signing on behalf of the node wallet accounts.
- `Node management`: stop, rollback, connect to other nodes.
- `Getting debug information`.

<br>

For example, you can get the current node status:<br><br>
![](./images/restapi.png)
<br><br>

### Software Development Kits ###

Specially for developers wishing to interact with the Waves blockchain, there is a great opportunity<br>
We created multiple libraries in different programming languages that allow you to:

- **<ins>Work with cryptography</ins>**:<br> 
    Generation of private/public keys and wallet addresses.<br>
- **<ins>Work with transactions</ins>**:<br>
    Creating, signing, and broadcasting transactions.<br> 
- **<ins>Interact with the Waves node</ins>**:<br>
    Reading blockchain data, node interaction, and working with cryptography.<br>
    
The list of supported languages:
- [JavaScript]()
- [Java]()
- [GoLang]()
- [Python]() 
- [PHP]()
- [C#]()
- [Rust]()
- [C++]()

Read more about [client libraries](https://docs.waves.tech/en/building-apps/waves-api-and-sdk/client-libraries).

### IDE Plugins ###


---

## Outro ##