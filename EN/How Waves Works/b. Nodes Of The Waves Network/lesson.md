# Nodes Of The Waves Network #

  - [Node Description](#node-description)
    - [Validating Node](#validating-node)
    - [Generating Node](#generating-node)
  - [Node Benefits](#node-benefits)

---

## Node Description ##

A node is a host that is connected to the blockchain [network]() using the [Waves Node](https://github.com/wavesplatform/Waves) application.<br>
In other words, it is a computer, a local machine in one big network that:<br>
- Is keeping the actual [blockchain copy](https://docs.waves.tech/en/waves-node/options-for-getting-actual-blockchain/state-downloading-and-applying);<br>
- Is participating in the block [validation]() process;<br>
- Can work with block [generation]().<br>

One of the major ideas of the blockchain is decentralization.<br>
To understand what decentralization is, it is better to explain first what centralization is.
<br><br>
This idea of centralization can be described with a simple example.<br>
If we imagine a typical centralized system, it can be a bank.<br>
All the information about banking accounts, transactions, all the client data - everything is stored in that specific bank.<br>
It would have total control over all of the client's funds and personal data.<br>
At any moment, at the bank's discretion, the account of a user can be blocked, and funds become frozen.<br>
Such a scenario can be the most negative outcome when it comes to centralized systems.<br>
<br>
In the blockchain, all the data is decentralized.<br> 
There are hundreds of independent nodes in the network, and each of them keeps a copy of all the blockchain data.<br>
Even if one particular node initiates a certain action, for example, a money transfer, all other nodes will necessarily validate if:
- This transaction is valid and [signed](https://docs.waves.tech/en/blockchain/transaction/transaction-proof#transaction-signature:~:text=of%20proofs.-,Transaction%20Signature,-If%20the%20transaction) with a [private key](https://docs.waves.tech/en/blockchain/glossary#private-key:~:text=the%20next%20block.-,Private%20key,-The%20private%20key);
- There is a sufficient balance on the account.
<br>

There are nearly hundreds Waves nodes across the globe:<br>
<img width="700px" src="https://miro.medium.com/max/1400/0*jLB-75Xqyrgw8rPk">

Nodes represent witnesses that keep an eye on all of the actions completed on the blockchain.<br>
They check transactions and blocks to whether they were valid or if there is any attempt to alter the blockchain data.<br>
If there is a fraudulent transaction initiated by a node, other nodes will verify if it is a valid action.<br>
Once found out that the transaction is invalid, it will be rejected and not be included in a block.<br>

![](./images/attacker.png)<br>
<!-- It is necessary to depict how a fraudulent attack of one node can look like. -->

---

### Validating Node ###

Every single node connected to the network is taking a part in the validation process.<br>
Once nodes receive a transaction, they begin the process of verification of that transaction.<br>
The transaction must:
- Be with correct [transaction fields](https://docs.waves.tech/en/blockchain/transaction/transaction-validation#:~:text=the%20following%20checks%3A-,Transaction%20fields%20check%20including,-%3A);
- Be completed only if the [balance of the sender is positive](https://docs.waves.tech/en/blockchain/transaction/transaction-validation#:~:text=the%20transaction%20type.-,Sender%27s%20balance%20check,-.);
- Contain [sender's signature](https://docs.waves.tech/en/blockchain/transaction/#sender-and-signature:~:text=Transaction%20Type%20article.-,Sender%20and%20Signature,-Each%20transaction%20contains) (ordinary accounts) or account script execution ([smart accounts](#chapter_with_smart_accounts));
- Conduct other complex verification.<br>
    See more about [transaction validation](https://docs.waves.tech/ru/blockchain/transaction/transaction-validation).

---

### Generating Node ###

A generating node is a node that generates blocks.<br>
All the nodes are [validating nodes](#validating-node), but not every node is a generating node.<br>
The right for block generation is given upon [LPoS consensus](#linke_to_first_chapter).<br>
For every block that a node generated, there is a reward this node receives.<br>
The reward amount is not fixed. At the current moment, it is equal to 6 WAVES.<br>
You can discover more about [generator's income](https://docs.waves.tech/en/blockchain/mining/).<br>

See more about [block generation](#next_chapter).

---

## Node Benefits ##

For every node holder, there are 2 ways to earn funds with the Waves blockchain:<br>

- By [block generation](#generating-node);
- By being a [lessor](https://docs.waves.tech/en/blockchain/transaction-type/lease-transaction).

In the topic [Mining And Earning On It]() we will explain the process of [node installation]() and [how to start mining]().<br>
As a quick preview, we will mention the minimal:

- System requirements:<br>
    
    | CPU | RAM | SSD | 
    | :----------:  | :----------:  | :----------: 
    | 2+ | 4+ GB| 100+ GB SSD|

- Node Requirements:<br>
    Generating node balance not less than 1000 WAVES.<br>
    See the full list of [node requirements](https://docs.waves.tech/en/blockchain/node/mining-node#:~:text=A%20node%20can%20generate%20blocks%20if%20the%20following%20conditions%20are%20met%3A).

In the next lesson, we will talk about the [Waves networks](), the networks that connect all the nodes together.<br>
