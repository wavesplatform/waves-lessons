# Waves Blockchain #

In this lesson, we will learn about the Waves blockchain.

Duration: <span></span> min

  - [Intro](#intro)
  - [Overview](#overview)
  - [Transactions](#transactions)
  - [Blocks](#blocks)
  - [Blockchain](#blockchain)
  - [Waves Blockchain Platform](#waves-blockchain-platform)
    - [Principles Of Work](#principles-of-work)
    - [Waves History](#waves-history)

---

## Intro ## 

To begin our journey to the Waves Blockchain Platform, we will first cover some basics.<br>
All the material will be given in a logical sequence to make understanding easier.<br>
This course will help people even with zero knowledge about blockchain to become PRO with Waves.

---

## Overview ##

As a quick overview, we will firstly talk about [transactions](#transactions), as one of the major essences that every blockchain contains.<br>
After that, the process of how transactions get wrapped in [blocks]() will be explained.<br>
The next step would be describing how all the [blocks]() form into a chain, known as [blockchain]().<br>
At the end of this lesson, we will get to know about the [Waves Blockchain Platform](), its [principles of work](), and its [history]().<br>

---

## Transactions ##

A transaction is an action on the [blockchain]() made on behalf of an account.<br>
In the real world, a familiar to us example would be transferring money from one bank account to another.<br>
This transaction would necessarily include such details as:
* Sender account;
* Recipient account;
* Details about the transfer (amount, commissions, etc).<br>

However, blockchain transactions are not totally the same as bank transactions.<br>
The difference with blockchain transactions is that they are:
* [More secure]();
* [Decentralized]();
* [Immutabile]();
* [Transparent]();
* [Of reduced costs]().

Generally, there are 3 different types of transactions in the Waves blockchain:
- [Tokenization](https://docs.waves.tech/en/blockchain/transaction-type/#tokenization:~:text=per%20the%20diagram.-,Tokenization,-Type%20ID)<br>Represents the work with token;
- [Usage](https://docs.waves.tech/en/blockchain/transaction-type/#tokenization:~:text=Protobuf%2C%20Failed%20transactions%E2%80%9D.-,Usage,-Type%20ID)<br>Aims at the main transaction usage;
- [Network](https://docs.waves.tech/en/blockchain/transaction-type/#tokenization:~:text=V6%2C%20MetaMask%20support%E2%80%9D.-,Network,-Type%20ID)<br>Works with leasing or sponsorship.
  
<br>

For this moment, it is not necessary to study all of the transaction types.<br>
Later, in the chapter [Operations with transactions](), this topic will be elaborated on in detail.<br>
As for now, it is enough to understand that a transaction is an action that is made by an account.

Below there are 2 examples of transactions that can be made with the Waves blockchain:<br>
- `Transfer Transaction`:
<br>Transfers a certain amount of [token](https://docs.waves.tech/en/blockchain/token/) to another account.
<br>More о about [Transfer Transaction](https://docs.waves.tech/ru/blockchain/transaction-type/transfer-transaction).
<br>

  ```Java
  // Necessary imports
  import com.wavesplatform.transactions.TransferTransaction;
  import com.wavesplatform.transactions.common.Amount;

  // Setting up the address of the recipient (bob) and data transaction (id and the amount of the transferable asset)
  TransferTransaction tx = TransferTransaction
          .builder(bob.address(), Amount.of(1000, new AssetId("7uncmN7dZfV3fYVvNdYTngrrbamPYMgwpDnYG1bGy6nA")))
          .getSignedWith(alice); // Signing the transaction with a private key of the alice user.

  // Sending the transaction to the blockchain node
  node.waitForTransaction(node.broadcast(tx).id());
  ```
  ```js
  ```
  ```php
  ```
  ```csharp
  ```
  ```go
  ```
  ```python
  ```

  <br>

  **Parameters Description**
  | Field | Description | Example |
  | ----------- | ----------- | ----------- |
  | assetId | Token ID base58 encoded.<br>null means transfer in WAVES. | 7uncmN7dZfV3fYVvNdYTngrrbamPYMgwpDnYG1bGy6nA |
  | amount | Amount of token to transfer:<br> an integer value specified in the minimum fraction (“cents”) of token.| 1000 |
  | recipient | Recipient address base58 encoded or recipient [alias](https://docs.waves.tech/en/blockchain/account/alias) with alias:<chain_id>:prefix.<br>For example alias:T:merry (see [Chain ID](https://docs.waves.tech/en/blockchain/blockchain-network/#chain-id)) | 3PFmoN5YLoPNsL4cmNGkRxbUKrUVntwyAhf |
  | attachment | 	Arbitrary binary data (typically a comment to transfer) base58 encoded, up to 140 bytes. | 3vrgtyozxuY88J9RqMBBAci2UzAq9DBMFTpMWLPzMygGeSWnD7k | 
  <!-- | sender | Адрес отправителя в кодировке base58 | 3P274YB5qseSE9DTTL3bpSjosZrYBPDpJ8k |
  | proofs | | | -->

- `Exchange Transaction`:<br>
  Exchanges two different tokens between two accounts.<br>
  More about [Exchange Transaction](https://docs.waves.tech/en/blockchain/transaction-type/exchange-transaction).<br>
    
  ```Java
  // Necessary imports
  import java.util.Arrays;
  import com.wavesplatform.transactions.ExchangeTransaction;
  import com.wavesplatform.transactions.IssueTransaction;
  import com.wavesplatform.transactions.common.Amount;
  import com.wavesplatform.transactions.common.AssetId;
  import com.wavesplatform.transactions.common.Base64String;
  import com.wavesplatform.transactions.exchange.Order;
  import com.wavesplatform.transactions.exchange.OrderType;

  // Creation of a test token with the name "Asset" in the quantity of 1000 and 0 decimals
  AssetId assetId = node.waitForTransaction(node.broadcast(
          IssueTransaction.builder("Asset", 1000, 0)
          .getSignedWith(alice)).id(),
          IssueTransactionInfo.class).tx().assetId();

  // Setting the desired amount of asset and its price
  Amount amount = Amount.of(1);
  Amount price = Amount.of(100, assetId);

  // Setting the commission of the matcher
  long buyMatcherFee = 300000;
  long sellMatcherFee = 300000;

  // Creation of buy order
  Order buy = Order.builder(OrderType.BUY, amount, price, alice.publicKey())
          .getSignedWith(bob);
  // Creation of sell order
  Order sell = Order.builder(OrderType.SELL, amount, price, alice.publicKey())
          .getSignedWith(alice);

  // Complete the exchange transaction
  ExchangeTransaction tx = ExchangeTransaction
          .builder(buy, sell, amount.value(), price.value(), buyMatcherFee, sellMatcherFee)
          .getSignedWith(alice);

  // Sending the transaction to the blockchain node
  node.waitForTransaction(node.broadcast(tx).id());
  ```
  ```js
  ```
  ```php
  ```
  ```csharp
  ```
  ```go
  ```
  ```python
  ```
  
    **Parameters Description**
  | Field | Description | Example |
  | ----------- | ----------- | ----------- |
  | amount | Amount of the amount asset:<br> an integer value specified in the minimum fraction (“cent”) of asset | 1000 |
  | price | Price for the amount asset nominated in the price asset, multiplied by the factor:<br>- 10<sup>8</sup> for the Exchange transaction version 3;<br>- 10<sup>8 + priceAssetDecimals – amountAssetDecimals,<br>where amountAssetDecimals, priceAssetDecimals are decimals of the assets, for the Exchange transaction version 2 or 1.</sup>| 1134500 |
  | buyMatcherFee | Matcher fee for the buy order execution. The fee token ID is indicated in buy order. | 300000 |
  | sellMatcherFee | Matcher fee for the sell order execution. The fee token ID is indicated in sell order. | 750 | 
  | order1, order2 | Buy and sell orders. See the  [Order](https://docs.waves.tech/en/blockchain/order). | [Example](https://docs.waves.tech/en/blockchain/transaction-type/exchange-transaction#json-representation:~:text=%22order1%22%3A,%5D%0A%20%20%7D%2C)|

<br>

---

## Blocks ##

The second major essence in the blockchain is blocks.<br>
It is an abstraction over transactions.<br>
<br>
Let's give an example that is a real-life prototype.<br>
If there is a cargo that is being transferred from 'A' to 'B' point, it should be placed within a container.<br>
As well, for the cargo container, it is necessary to have:

- <ins>Serial number</ins><br>
  So that the enterprise that owns it, could identify it.
- <ins>Capacity</ins><br>
  It would help to understand how heavy the container is.
- <ins>Information about the cargo</ins><br>
  What type of cargo it is, the time it was sent, etc.
- <ins>List of items transferred</ins><br>
  Serves as a waybill that keeps all accounted for. 
- <ins>Counter of transferable items</ins><br>
  To escape any loss of the cargo unit.

Likewise, the blocks are the containers for transactions inside of them.<br>
These "containers" have:
- <ins>Block number</ins><br>
  Current serial number of the block, its height.
- <ins>Block size</ins><br>
  Size of all the data that a block has.<br>
- <ins>Block header</ins><br>
  Block metadata (timestamps), hashes of the previous block's header and the current's, etc.<br>
- <ins>Transaction counter</ins><br>
  Count of all transactions wrapped in the block.
- <ins>Transaction list</ins><br>
  List of all transactions inside the particular block.
  
<br>

This concept can be displayed with the following picture:<br>
<br>
<img width="700px" src="https://www.mdpi.com/applsci/applsci-09-01788/article_deploy/html/images/applsci-09-01788-g001.png">
<br>

A very important element in a block is a hash.<br>
<ins>Hash</ins> is a result of mathematical algorithms that converts an input value of any size to a certain combination of letters and numbers of a fixed size.<br>
For example, if we take the phrase "I love Waves", with the magic help of the SHA256 algorithm, this phrase would turn into the hash:<br>
` 0da73e9fd2df9630bcb689f5b66e76b7d1809d71ea841f7e075b8b82bd05a155 `<br><br>
Regardless of how many times we repeat this transformation, this phrase would always be equal to this hash.<br>
In the blockchain, a hash of a block is formed from all the data that the block is contained, including the hash of the previous block.<br>
This bond makes it impossible to falsify even a small piece of data, as it would create a totally different hashing sequence.<br>
<!-- You can read more about it in the chapter [Nodes of the Waves Network](). -->

---

## Blockchain ##

All the blocks don't exist by themselves, and they all are a part of the big sequence of blocks.<br>
This sequence of blocks is called a blockchain.<br>
On this picture, you may see a representation of this idea (from left to the right):<br>
<br>
<img src="https://miro.medium.com/max/977/1*mNdCyhj2WRSzmgTOVztaUg.png">
<br>
<br>
Since blockchain is decentralized, this chain of blocks is stored simultaneously at multiple independent nodes.<br>
See more about [Nodes]().
<br>

---

## Waves Blockchain Platform ##

Waves is a blockchain platform for issuing cryptographic tokens and conducting crowdfunding campaigns.<br>
The company offers everyone an open blockchain protocol that works with decentralized solutions.

<br>

### Principles Of Work ###
The platform operates on the basis of the LPoS [consensus]().<br>
It is a modification of the [Proof-of-stake consensus]().<br>
The difference between PoS and LPoS is that LPoS has the ability for users to transfer their balances to mining nodes.<br>
Such a deal grants the lessor a portion of the profit for block generation by lessee nodes.<br>
Therefore, the beneficiary is not only the miners but also the lessors.<br>
You can read more about how to get a profit with [mining]() and [leasing]().

With Waves, you can operate with cryptocurrencies and fiat the same way as with such popular blockchains as Bitcoin.<br>
The platform gives access to classical P2P trading and has all necessary crypto-graphical encryption to the highest security standards.<br>
All our users may create, promote, and use their own custom tokens, which be sold on the open market through crowdfunding .<br>
Waves has its own token, called "Waves", which can be used as a payment currency and reward for block generation and commissions
<br><br>

### Waves History ###
The story of the company has begun in 2016.<br>
With the help of the crowdfunding platform, the company received approximately 30,000 BTC for its further development.<br>
A year later, there was launched a decentralized exchange platform within the Waves project.<br>
Multiple infrastructure tools were created and presented to the blockchain community:
- Development environment [Waves IDE]();
- [Waves Network Explorer]();
- [Signer](), a tool for transaction signing;
- [Software Development Kits]() to operate with blockchain;
- [Plugins]() for development in multiple IDEs;
- [API]() for RESTful interaction with blockchain nodes.<br><br>

Since then, the Waves blockchain platform became ultimately popular, scoring over a million of devoted users.<br>
You can also get the best experience, enjoying all the advantages of the Waves blockchain.<br>

In the next lesson, we will concentrate on how on [nodes of the Waves network]() function and the benefits of having one.


<br><br><br>
