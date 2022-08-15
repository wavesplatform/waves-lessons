## Blockchain ##

What is a blockchain?  
It’s just a data structure with specific rules: a number of transactions are combined into a block, where each block has a unique hash identifier obtained from hashes of all transactions and a hash string of the **previous** block.

This sequence (or chain) of blocks is a blockchain.  
This unique data structure makes the blockchain **immutable** and protects it from mutations or malicious changes.  
If something is changed in block A, all subsequent blocks will be invalid and must be created again.

![](./img/blockchain.png)

## Transaction ##

What is a transaction?   
The simplest explanation of a transaction is that it is an **event**.  
A transaction in a blockchain is a new record with some required and optional fields.  
Each new record **changes the state of the blockchain**: for example, transfers tokens from one account to another, deploys a smart contract, or invokes it.

The Waves blockchain supports many different types of transactions at a core level.  
For example, an “asset transfer transaction” contains a timestamp, sender, recipient, amount, and transaction **fee**.

A transaction typically contains the sender’s digital **signature**.  
Anyone can verify the integrity of the transaction data and the authenticity of the signature, so it can be ensured that the transaction’s signature matches the sender’s public key.

## Nodes ##

What is a node?  
The blockchain network consists of nodes.  
A node is a computer that stores the blockchain data or just their hashes, validates transactions and blocks, verifies signatures, and synchronizes the data with other nodes.  

Let’s imagine we have hundreds and thousands of copies of this data distributed on different computers across many countries and continents.  
We have to rewrite the blocks on most of these copies to change the block history.  
That is why you might have heard that blockchain can ensure data is **immutable** for a long time.

![](./img/nodes.png)

The problem is that different machines can generate different chains of blocks – either deliberately or by accident.  
So the copies of the blockchain they hold may not be the same. This phenomenon is called a **fork**.

![](./img/fork.png)

To keep the same data across different machines, all participants must reach a **consensus** for each new block.  
The network participants must agree on **who** is responsible for generating a new block and whether that block is **valid**.  
The participant who created the block is called a block miner, block generator, or block producer.  
The block generation process is called mining.  

## Types of consensus ##

There are many types of consensus algorithms with different advantages and disadvantages.

### Proof of work (PoW) ###

Proof of Work (PoW) is the first classical consensus algorithm.  
It is based on the computation of a unique “nonce” value, which produces a hash result with a specific number of zeros.  
The first one lucky enough to find the solution gets the opportunity to add the block to the chain and receive a reward.  
The probability of finding the “nonce” depends on total computational power.  
It’s a pretty expensive consensus algorithm and not efficient in terms of scalability and speed.  
The computation process consumes large quantities of electricity, meaning PoW no longer meets environmental standards.  

Bitcoin and Ethereum blockchain networks are based on Proof of Work; however, Ethereum is now transitioning to Proof of Stake.  

### Proof of stake (PoS) ###

Proof of Stake (PoS) is a category of consensus algorithms that depend on a participant’s economic stake in the network.  
Anyone who holds the blockchain’s native cryptocurrency has a chance to add a block and be rewarded.  
Creating a block depends on the participant’s stake (balance) computational power, drastically reducing energy consumption.  
Examples of uses include NXT, Tezos, Peercoin, and Blackcoin.  

**Delegated proof of stake** is a version of PoS, where all cryptocurrency holders vote for their delegates.  
Delegates are responsible for validating transactions, creating new blocks, and maintaining a network.  
The best analogy for this is the US presidential elections.  
Token holders elect delegates through a Delegated Proof-of-Stake consensus mechanism.  
The number of delegates is limited to a predefined and relatively small number.  
No one else can participate in the block creation process.  
There are many questions about whether this should be considered real decentralization.  
DPoS is used in Cosmos, Tron, and EOS.  

The Waves blockchain uses **Leased Proof of Stake (LPoS)** consensus instead.  
Rather than selecting a limited number of block producers, LPoS users can lease (not transfer) an amount of Waves tokens to nodes they like or trust.  
The probability of being a block generator is proportional to the total amount of tokens leased to that account.  
Leased WAVES are locked in the user’s account and cannot be transferred or traded.  
Still, the tokens remain in complete control of the account holder, and leases can be canceled at any time.

### Proof of authority (PoA) ###

Proof of Authority (PoA) is an alternative consensus mechanism that relies on known and reputable validators to produce blocks.  
PoA is geared toward enterprises or private organizations that want to build chains that are essentially closed and do not involve external participants.

## Why blockchain is marvelous ##

Blockchain has several important properties:

- **<u>Decentralization:</u>**  
  There is no main storage server.  
  All records are copied and stored in different places.  
  When new information is added, it appears in all copies after verification.  
- **<u>Reliability:</u>**  
  Any attempts to make unauthorized changes will be rejected because of inconsistency with other copies.  
  No one has the power to manipulate or destroy the data.  
- **<u>Immutability</u>:**  
  Once a transaction enters the blockchain, its data cannot be manipulated, edited, or deleted.  
- **<u>Transparency</u>:**  
  Each participant can read data and track all transactions.  
- **<u>Pseudo-anonymity</u>:**  
  Anyone can track transactions but cannot identify the sender or recipient.  
  Only a private key is required to sign a transaction, which itself is not associated with a person.  
  Everything is anonymous unless you state that a particular public address belongs to you or someone you know.  
- **<u>Reduced costs</u>:**  
  If we use any systems for funds transfers like SWIFT, we pay a hefty commission for the transfer.  
  Private companies charge us significant payments for the usage of their service.  
  Fees in the blockchain are often less since no mediator keeps the profit to himself.  

In this lesson, we talked about the basics of blockchain — transactions, blocks, consensus mechanisms like proof-of-work and proof-of-stake, and delegated and leased versions of proof of stake.  
  
In the next lesson, we will give some insights into how all these blockchain properties are used in [Web3 services]().