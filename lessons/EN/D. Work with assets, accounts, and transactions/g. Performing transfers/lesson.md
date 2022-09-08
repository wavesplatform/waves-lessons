## Transactions performing transfers ##  

As we mentioned in [Transaction types]() of the lesson [Transaction definition and work with transactions](), there are three transactions types that can be classified as transactions intended for performing transfers:
- [Transfer transaction](#transfer-transaction)
- [Mass transfer transaction](#mass-transfer-transaction)  
- [Exchange transaction](#exchange-transaction)

Within this lesson, we will describe these transaction types in detail. Firstly, we will discuss what a transaction is intended for. Secondly, transaction attributes will be explained. Lastly, a demonstration of how this transaction is created in different programming languages (Javascript, Java, PHP, C#, Go, Python) will be given.

## Transfer transaction ##

### Description ###

The transfer transaction transfers a certain amount of token from one account to another.

The minimum fee for a Transfer transaction is 0.001 WAVES, in case of transferring a smart asset 0.005 WAVES. Read more about [Transfer transactions](https://docs.waves.tech/en/blockchain/transaction-type/transfer-transaction).

### Attributes ###

### Example ###


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

## Mass transfer transaction ##

### Description ###

The mass transfer transaction transfers a token from one account to several accounts, from 1 to 100.

The minimum fee for a Mass Transfer transaction is `0.001 + 0.0005 × N WAVES`, in case of transferring a smart asset `0.005 + 0.0005 × N WAVES`, where `N` is the number of recipients. The fee value is rounded up to three decimals. Read more about [Mass transfer transaction](https://docs.waves.tech/en/blockchain/transaction-type/mass-transfer-transaction).

### Attributes ###

### Example ###

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

## Exchange transaction ##

### Description ###

The exchange transaction exchanges two different tokens between two accounts. Every account can place an order to exchange one token for another. Once a user creates an order for currency exchange, for example, a sell order with the pair WAVES/BTC to sell WAVES and receive BTC, the transaction will be sent to the matcher. The matcher will execute the exchange in case there is any user who would like to sell BTC and receive WAVES, securing the guarantee that the terms of the exchange are not worse than those indicated in each order. Creating an order does not transfer tokens from an account, tokens remain on the account until the matcher executes the order and creates the exchange transaction.

The minimum fee for an exchange transaction is 0.003 WAVES. Read more about [fees for exchange transaction](https://docs.waves.tech/en/blockchain/transaction-type/exchange-transaction#transaction-fee) and [Exchange transaction](https://docs.waves.tech/en/blockchain/transaction-type/exchange-transaction).

### Attributes ###

### Example ###

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