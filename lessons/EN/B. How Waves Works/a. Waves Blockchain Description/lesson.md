# Waves Blockchain Description #

  - [Intro](#intro)
  - [Overview](#overview)
  - [Waves Blockchain Platform](#waves-blockchain-platform)
    - [Principles Of Work](#principles-of-work)
    - [Waves History](#waves-history)
  - [Transactions](#transactions)
  - [Blocks](#blocks)
  - [Blockchain](#blockchain)


---

## Intro ## 

To begin our journey to the Waves Blockchain Platform, we will first cover some basics.  
All the material will be given in a logical sequence to make understanding easier.  
This course will help people even with zero knowledge about blockchain to become PRO with Waves.

---

## Overview ##

As a quick overview, we will firstly learn about [Waves Blockchain Platform](#waves-blockchain-platform), its [principles of work](#principles-of-work), and its [history](#waves-history).  
After this, we will get to know about [transactions](#transactions), as one of the major essences that every blockchain contains.  
The next step would be describing the process of how transactions get wrapped in [blocks]().  
At the end of the lesson, you will discover how all [blocks]() form into a chain, known as [blockchain]().  

---

## Waves Blockchain Platform ##

Waves is a [blockchain](#blockchain) platform for issuing cryptographic tokens and conducting crowdfunding campaigns.  
The company offers everyone an open blockchain protocol that works with [decentralized](#decentralizationfirstchapter) solutions.

  

### Principles Of Work ###
The platform operates on the basis of the [LPoS consensus]().  
It is a modification of the [Proof-of-stake consensus]().  
The difference between PoS and LPoS is that LPoS has the ability for users to transfer their balances to mining nodes.  
Such a deal grants the lessor a portion of the profit for block generation by lessee nodes.  
Therefore, the beneficiary is not only the miners but also the lessors.  
You can read more about how to get a profit with [mining]() and [leasing]().

With Waves, you can operate with cryptocurrencies and fiat the same way as with such popular blockchains as Bitcoin.  
The platform gives access to classical P2P trading and has all necessary crypto-graphical encryption to the highest security standards.  
All our users may create, promote, and use their own [custom tokens](#issueandassettransactionschapter), which be sold on the open market through crowdfunding .  
Waves has its own token, called "Waves", which can be used as a payment currency and reward for block generation and commissions
    

### Waves History ###
The story of the company has begun in 2016.  
With the help of the crowdfunding platform, the company received approximately 30,000 BTC for its further development.  
A year later, there was launched a decentralized exchange platform within the Waves project.  
Multiple infrastructure tools were created and presented to the blockchain community:
- Development environment [Waves IDE]();
- [Waves Network Explorer]();
- [Signer](), a tool for transaction signing;
- [Software Development Kits]() to operate with blockchain;
- [Plugins]() for development in multiple IDEs;
- [API]() for RESTful interaction with blockchain nodes.    

Since then, the Waves blockchain platform became ultimately popular, scoring over a million of devoted users.  
You can also get the best experience, enjoying all the advantages of the Waves blockchain.  

## Transactions ##

A transaction is an action on the [blockchain]() made on behalf of an account.  
In the real world, a familiar to us example would be transferring money from one bank account to another.  
This transaction would necessarily include such details as:
* **<ins>Sender account</ins>**;
* **<ins>Recipient account</ins>**;
* **<ins>Details about the transfer</ins>**.  
  (currency, amount, commissions, etc)

However, blockchain transactions are not totally the same as bank transactions.  
The difference with blockchain transactions is that they are:
* [Decentralized]();
* [More secure]();
* [Immutable]();
* [Transparent]();
* [Of reduced costs]().

Generally, there are 3 different types of transactions in the Waves blockchain:
- [Tokenization](https://docs.waves.tech/en/blockchain/transaction-type/#tokenization:~:text=per%20the%20diagram.-,Tokenization,-Type%20ID)  
  Represents the work with token.
- [Usage](https://docs.waves.tech/en/blockchain/transaction-type/#tokenization:~:text=Protobuf%2C%20Failed%20transactions%E2%80%9D.-,Usage,-Type%20ID)  
  Aims at the main transaction usage.
- [Network](https://docs.waves.tech/en/blockchain/transaction-type/#tokenization:~:text=V6%2C%20MetaMask%20support%E2%80%9D.-,Network,-Type%20ID)  
  Works with leasing or sponsorship.
  
  

For this moment, it is not necessary to study all of the transaction types.  
Later, in the chapter [Operations with transactions](), this topic will be elaborated on in detail.  
The essence of all transactions in the blockchain is an operation with an account or/and an asset.  
  
Once there is any transaction, it is sent to a [node]() of a [network]() from an account.  
This recipient node shares this transaction with other nodes within this network.  
The other nodes will continue sharing this transaction until all the nodes of the network receive it.  
Read more about [Nodes Of The Waves Network]().


Below there are 2 examples of transactions that can be made with the Waves blockchain:  
- `Transfer Transaction`:  
Transfers a certain amount of [token](https://docs.waves.tech/en/blockchain/token/) to another account.  
For example, we can transfer 10 WAVES from account "alice" to account "bob".  
This transaction would necessary include parameters, such as given in the table below.

  | Field | Description | Example |
  | ----------- | ----------- | ----------- |
  | assetId | Token ID base58 encoded.<br>null means transfer in WAVES. | 7uncmN7dZfV3fYVvNdYTngrrbamPYMgwpDnYG1bGy6nA |
  | amount | Amount of token to transfer:<br> an integer value specified in the minimum fraction (“cents”) of token.| 1000 |
  | recipient | Recipient address base58 encoded or recipient [alias](https://docs.waves.tech/en/blockchain/account/alias) with alias:<chain_id>:prefix.<br>For example alias:T:merry (see [Chain ID](https://docs.waves.tech/en/blockchain/blockchain-network/#chain-id)) | 3PFmoN5YLoPNsL4cmNGkRxbUKrUVntwyAhf |
  | attachment | 	Arbitrary binary data (typically a comment to transfer) base58 encoded, up to 140 bytes. | 3vrgtyozxuY88J9RqMBBAci2UzAq9DBMFTpMWLPzMygGeSWnD7k | 

  More о about [Transfer Transaction](https://docs.waves.tech/ru/blockchain/transaction-type/transfer-transaction).

- `Exchange Transaction`:  
  Exchanges two different tokens between two accounts.  
  The Exchange transaction contains two counter orders: a buy order and a sell order.  
  It has the following parameters:

  | Field | Description | Example |
  | ----------- | ----------- | ----------- |
  | amount | Amount of the amount asset:<br> an integer value specified in the minimum fraction (“cent”) of asset | 1000 |
  | price | Price for the amount asset nominated in the price asset, multiplied by the factor:<br>- 10<sup>8</sup> for the Exchange transaction version 3;<br>- 10<sup>8 + priceAssetDecimals – amountAssetDecimals,<br>where amountAssetDecimals, priceAssetDecimals are decimals of the assets, for the Exchange transaction version 2 or 1.</sup>| 1134500 |
  | buyMatcherFee | Matcher fee for the buy order execution. The fee token ID is indicated in buy order. | 300000 |
  | sellMatcherFee | Matcher fee for the sell order execution. The fee token ID is indicated in sell order. | 750 | 
  | order1, order2 | Buy and sell orders. See the  [Order](https://docs.waves.tech/en/blockchain/order). | [Example](https://docs.waves.tech/en/blockchain/transaction-type/exchange-transaction#json-representation:~:text=%22order1%22%3A,%5D%0A%20%20%7D%2C)|

  More about [Exchange Transaction](https://docs.waves.tech/en/blockchain/transaction-type/exchange-transaction).  

---

## Blocks ##

The second major essence in the blockchain is blocks.  
It is an abstraction over transactions.  
  
Let's give an example that is a real-life prototype.  
If there is a cargo that is being transferred from 'A' to 'B' point, it should be placed within a container.  
As well, for the cargo container, it is necessary to have:

- <ins>Serial number</ins>  
  So that the enterprise that owns it, could identify it.
- <ins>Capacity</ins>  
  It would help to understand how heavy the container is.
- <ins>Information about the cargo</ins>  
  What type of cargo it is, the time it was sent, etc.
- <ins>List of items transferred</ins>  
  Serves as a waybill that keeps all accounted for. 
- <ins>Counter of transferable items</ins>  
  To escape any loss of the cargo unit.

Likewise, the blocks are the containers for transactions inside of them.  
These "containers" have:
- <ins>Block number</ins>  
  Current serial number of the block, its height.
- <ins>Block size</ins>  
  Size of all the data that a block has.  
- <ins>Block header</ins>  
  Block metadata (timestamps), hashes of the previous block's header and the current's, etc.  
- <ins>Transaction counter</ins>  
  Count of all transactions wrapped in the block.
- <ins>Transaction list</ins>  
  List of all transactions inside the particular block.
  
  

This concept can be displayed with the following picture:  
  
<img width="700px" src="https://www.mdpi.com/applsci/applsci-09-01788/article_deploy/html/images/applsci-09-01788-g001.png">
  

A very important element in a block is a hash.  
<ins>Hash</ins> is a result of mathematical algorithms that converts an input value of any size to a certain combination of letters and numbers of a fixed size.  
For example, if we take the phrase "I love Waves", with the magic help of the SHA256 algorithm, this phrase would turn into the hash:  
` 0da73e9fd2df9630bcb689f5b66e76b7d1809d71ea841f7e075b8b82bd05a155 `    
Regardless of how many times we repeat this transformation, this phrase would always be equal to this hash.  
In the blockchain, a hash of a block is formed from all the data that the block is contained, including the hash of the previous block.  
This bond makes it impossible to falsify even a small piece of data, as it would create a totally different hashing sequence.  
<!-- You can read more about it in the chapter [Nodes of the Waves Network](). -->

---

## Blockchain ##

All the blocks don't exist by themselves, and they all are a part of the big sequence of blocks.  
This sequence of blocks is called a blockchain.  
On this picture, you may see a representation of this idea (from left to the right):  
  
<img src="https://miro.medium.com/max/977/1*mNdCyhj2WRSzmgTOVztaUg.png">
  
  
Since blockchain is decentralized, this chain of blocks is stored simultaneously at multiple independent nodes in the network.  
  

In the next lesson, we will concentrate on how on [nodes of the Waves network]() function and the benefits of having one.

---

