## Transactions performing transfers ##  

As we mentioned in [Transaction types]() of the lesson [Transaction definition and work with transactions](), there are two transactions types that can be classified as transactions intended for work with leasing:
- [Lease](#lease-transaction) 
- [Lease cancel](#lease-cancel-transaction)  

Within this lesson, we will describe these transaction types in detail. Firstly, we will discuss what a transaction is intended for. Secondly, transaction attributes will be explained. Lastly, a demonstration of how this transaction is created in different programming languages (Javascript, Java, PHP, C#, Go, Python) will be given.

## Lease transaction ##

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

## Lease cancel transaction ##

### Description ###

The lease cancel transaction cancels [leasing](#lease-transaction).

Read more about [Lease cancel transaction](https://docs.waves.tech/en/blockchain/transaction-type/lease-cancel-transaction).

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