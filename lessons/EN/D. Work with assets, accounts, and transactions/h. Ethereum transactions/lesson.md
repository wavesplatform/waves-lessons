## Transaction in the Ethereum format ##  

All MetaMask users can operate with the Waves blockchain: they can invoke a dApp script or transfer tokens. [MetaMask](https://metamask.io/) is a popular cryptocurrency wallet that is intended for interaction with the [Ethereum blockchain](https://pt.wikipedia.org/wiki/Ethereum), and due to this fact, there are certain limitations of direct operations between the Waves blockchain and MetaMask. Since multiple users are used to MetaMask experiences and do not wish to change traditions and switch to alternative wallets, the Waves team made it easy for MetaMask wallet users to operate with the Waves blockchain without the necessity to change the wallet. Read more about [MetaMask](https://docs.waves.tech/en/keep-in-touch/metamask).

As we mentioned in the [Transaction types]() of the lesson [Transaction definition and work with transactions](), it is possible to perform a transaction in the Ethereum format on the Waves blockchain. The Ethereum transaction can include either an [Ethereum transfer](#ethereum-transfer) or an [Ethereum dApp script invocation](#ethereum-dapp-script-invocation), yet it is still considered one transaction type.

Within this lesson, we will describe this transaction type in detail. Firstly, we will discuss what transaction methods are intended for. Secondly, transaction attributes will be explained. Lastly, a demonstration of how this transaction is created in different programming languages (Javascript, Java, PHP, C#, Go, Python) will be given.

## Ethereum transfer ##

### Description ###

<!-- The Ethereum transaction allows to make a transfer. A MetaMask user can sign an Ethereum transaction that transfers a token and send the transaction to the Waves blockchain. An Ethereum transaction cannot be sent from a smart account or dApp.  -->

The minimum fee for an Ethereum transaction is equal to the [Transfer transaction], i.e. . Read more about [Lease transactions](https://docs.waves.tech/en/blockchain/transaction-type/lease-transaction).

### Attributes ###

### Transaction example ###


<CodeBlock>

```js
```
```java
```
```php
```
```csharp
```
```go
```
```python
```

</CodeBlock>

## Ethereum dApp script invocation ##

### Description ###

The lease transaction leases WAVES to another account. The larger the generating balance of a node is, the higher the chances for that node to be selected to generate the next block. Commonly node owners share the reward for generated blocks with lessors. In the lesson [Summary of mining node requirements](), we listed necessary requirements to have a generating node and offer instructions on how to start mining. Leasing can be canceled anytime so that all WAVES will return to the lessor's balance.

Therefore there are two ways when leasing can profit you:
- **<u>Leasing WAVES to another account</u>**  
    Multiple nodes are participating in the contest of block generation, where there is a reward equal to 6 WAVES for every block generated (the reward is not static and may change). As long as the Waves blockchain sticks to the [LPoS consensus](https://docs.waves.tech/en/blockchain/leasing), there is always only one block generator that receives the right to generate a block. You may lease your WAVES to any node you think has the most considerable potential to generate a block and receive a percentage of the payout for block generation as a reward. 
- **<u>Generating a new block in the Waves blockchain</u>**  
    You can also receive a reward for block generation on the Waves blockchain. Block generation becomes possible after satisfying all [requirements for mining](), where one essential requirement is a generating balance of not less than 1000 WAVES. If you do not have enough generating balance, you may try to attract lessors to lease WAVES to your node. In case you manage to generate a block, you will receive a reward, and the lessor, the percentage of the reward your received.

The minimum fee for a Lease transaction is 0.001 WAVES. Read more about [Lease transactions](https://docs.waves.tech/en/blockchain/transaction-type/lease-transaction).

### Attributes ###

### Transaction example ###