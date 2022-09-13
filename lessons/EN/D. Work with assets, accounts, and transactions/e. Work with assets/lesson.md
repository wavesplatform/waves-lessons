## Transactions of work with assets ##  

As we mentioned in [Transaction types]() of the lesson [Transaction definition and work with transactions](), there are six transactions types that can be classified as transactions intended for work with assets:
- [Issue transaction](#issue-transaction)  
- [Reissue transaction](#reissue-transaction)  
- [Update asset info transaction](#update-asset-info-transaction)  
- [Burn transaction](#burn-transaction)  
- [Set asset script transaction](#set-asset-script-transaction)  
- [Sponsor fee transaction](#sponsor-fee-transaction)

Within this lesson, we will talk about these transaction types in detail. Firstly, we will discuss what a transaction is intended for. Secondly, transaction attributes will be explained. Lastly, a demonstration of how this transaction is created in different programming languages (Javascript, Java, PHP, C#, Go, Python) will be given.

## Issue transaction ##

### Description ###

The issue transaction is intended for issuing a new [token](https://docs.waves.tech/en/blockchain/token/) on the Waves blockchain. As per [Asset creation and operation with assets](), we mentioned two different purposes for creating a new token within the blockchain: a new token as a cryptocurrency or as an object. 

<Message type="warning">

The minimum fee for an issue transaction is 1 WAVES, in case of issue of a non-fungible token (NFT) 0.001 WAVES.
</Message>

Read more about [Issue transaction](https://docs.waves.tech/en/blockchain/transaction-type/issue-transaction).

### Attributes ###

| Arguement | Description | Example |
| :--- | :--- | :--- |
| name | Token name. <br>From 4 to 16 bytes (1 character can take up to 4 bytes).| sampleasset |
| description | Token description. From 0 to 1000 bytes.| description of the asset |
| quantity | Token quantity.<br> An integer value specified in the minimum fraction (“cents”), that is, the real quantity multiplied by 10<sup>decimals</sup>.<br>From 1 to 9,223,372,036,854,775,807.<br>1 for NFT.| 1000 |
| decimals | Number of decimal places, from 0 to 8.<br>0 for NFT.| 2 |
| reissuable | Reissue availability flag, see the [Reissue Transaction]() article.<br>`false` for NFT. | false |
| script | For a smart asset: a compiled asset script, up to 8192 bytes, base64 encoded.<br>For a token without a script: `null`.<br>The token issued without a script cannot be converted to a smart asset. | null |

### Example ###

<CodeBlock>

```js
```
```java
// Create an issue transaction
IssueTransaction tx = new IssueTransaction(
        senderPublicKey,
        "sampleasset", 
        "description of the asset", 
        1000, 
        2, 
        false,
        null
).addProof(senderPrivateKey); 
// Broadcast the transaction to a node and wait for it to be included in the blockchain
node.waitForTransaction(node.broadcast(tx).id());
// Get information about the transaction from a node
IssueTransactionInfo txInfo = node.getTransactionInfo(tx.id(), IssueTransactionInfo.class);
```
```php
```
```csharp
```
```go
const waves = 100_000_000

func main() {
    // Current time in milliseconds
    ts := uint64(time.Now().UnixMilli())
    // Creating an Issue transaction
    tx := proto.NewUnsignedIssueWithProofs(3, proto.TestNetScheme, pk, "sampleasset", "description of the asset",
        1000_00, 2, false, nil, ts, 1*waves)
    // Sing the transaction with the private key
    err = tx.Sign(proto.TestNetScheme, sk)
    if err != nil {
        panic(err)
    }
    // Context to cancel the request execution on timeout
    ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
    defer cancel()
    // Broadcast the transaction to the network
    _, err = cl.Transactions.Broadcast(ctx, tx)
    if err != nil {
        panic(err)
    }
}
```
```python
```

</CodeBlock>

## Reissue transaction ##

### Description ###

The reissue transaction aims to increase the amount of a [token](https://docs.waves.tech/en/blockchain/token/) that was created via [Issue transaction](#issue-transaction). Only the token issuer can perform a reissue transaction. The additional amount of token increases the balance of the transaction sender. As well, it is possible to make your token non-reissuable, which makes it impossible to reissue the token later.

<Message type="warning">

The minimum fee for a reissue transaction is 0.001 WAVES.
</Message>

Read more about [Reissue transaction](https://docs.waves.tech/en/blockchain/transaction-type/reissue-transaction).

### Attributes ###

| Arguement | Description | Example |
| :--- | :--- | :--- |
| quantity | Amount of token to reissue: an integer value specified in the minimum fraction (“cents”) of token.<br>The total quantity of token as a result of the reissue should not exceed 9,223,372,036,854,775,807. | 1000 |
| assetId | Token ID base58 encoded.<br>Read more on [how to create an asset](#issue-transaction). | `GSFk5Ziwx33g8KuMyh6wYerxJcHXdcGgXFiBYXH58AE6` |
| reissuable | Reissue availability flag. | `true` |

### Example ###

<CodeBlock>

```js
```
```java
// Create a reissue transaction
ReissueTransaction tx = new ReissueTransaction(
        senderPublicKey,
        Amount.of(1000, assetId),
        true
).addProof(senderPrivateKey);
// Broadcast the transaction to a node and wait for it to be included in the blockchain
node.waitForTransaction(node.broadcast(tx).id());
// Get information about the transaction from a node
ReissueTransactionInfo txInfo = node.getTransactionInfo(tx.id(), ReissueTransactionInfo.class);
```
```php
```
```csharp
```
```go

const waves = 100_000_000

func main() {
    // Current time in milliseconds
    ts := uint64(time.Now().UnixMilli())
    // Create the asset ID from a string
    assetID, err := crypto.NewDigestFromBase58("<your-asset-id-base58>")
    if err != nil {
        panic(err)
    }
    // Create a Reissue transaction
    tx := proto.NewUnsignedReissueWithProofs(3, proto.TestNetScheme, pk, assetID, 100_00, false, ts, 1*waves)
    // Sing the transaction with the private key
    err = tx.Sign(proto.TestNetScheme, sk)
    if err != nil {
        panic(err)
    }
    // Context to cancel the request execution on timeout
    ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
    defer cancel()
    // Broadcast the transaction to the network
    _, err = cl.Transactions.Broadcast(ctx, tx)
    if err != nil {
        panic(err)
    }
} 
```
```python
```

</CodeBlock>

## Update asset info transaction ##

### Description ###

The update asset info transaction updates the name or the description of a [token](https://docs.waves.tech/en/blockchain/token/). Only the token issuer can perform an update asset info transaction.  
The token name and/or description can be changed in [different networks]() with different requirements:
- **<u>Mainnet and Testnet</u>**:  
    Not earler than after 100,000 or more blocks from the last change (or the token issue). Example: a token was updated the last time at the height of 1,530,000 blocks, meaning that the next change will be available not earlier than at the height of 1,630,000 blocks.
- **<u>Stagenet</u>**:  
    Not earlier than after 10 or more blocks from the last change (or the token issue).

The average time of block creation is approximately one minute.

<Message type="warning">

The minimum fee for an update asset info transaction is 0.001 WAVES, in case of a smart asset 0.005 WAVES.
</Message>

Read more about [Update asset info transaction](https://docs.waves.tech/en/blockchain/transaction-type/update-asset-info-transaction).

### Attributes ###

| Arguement | Description | Example |
| :--- | :--- | :--- |
| assetId | Token ID base58 encoded.<br>Read more on [how to create an asset](#issue-transaction). | `syXBywr2HVY7wxqkaci1jKY73KMpoLh46cp1peJAZNJ` |
| name | Token name. From 4 to 16 bytes. | New Asset |
| description | Token description. From 0 to 1000 bytes. | New description |

### Example ###

<CodeBlock>

```js
```
```java
// Create an update asset info transaction
UpdateAssetInfoTransaction tx = new UpdateAssetInfoTransaction(
        senderPublicKey,
        assetId,
        "New Asset",
        "New description"
).addProof(senderPrivateKey);
// Broadcast the transaction to a node and wait for it to be included in the blockchain
node.waitForTransaction(node.broadcast(tx).id());
// Get information about the transaction from a node
UpdateAssetInfoTransactionInfo txInfo = node.getTransactionInfo(tx.id(), UpdateAssetInfoTransactionInfo.class);
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

## Burn transaction ##

### Description ###

The burn transaction decreases the amount of a [token](https://docs.waves.tech/en/blockchain/token/) on the sender's account and thereby the total amount of the token on the blockchain. Any account that owns a token (not necessarily the token issuer) can perform a burn transaction. Burned tokens cannot be restored on the account.

<Message type="warning">

The minimum fee for a burn transaction is 0.001 WAVES, in case of burning a [smart asset]() 0.005 WAVES.
</Message>

Read more about [Burn transaction](https://docs.waves.tech/en/blockchain/transaction-type/burn-transaction).

### Attributes ###

| Arguement | Description | Example |
| :--- | :--- | :--- |
| amount | Amount of token to burn: an integer value specified in the minimum fraction (“cents”) of token. | 1000 |
| assetId | Token ID base 58 encoded. Read more on [how to create an asset](#issue-transaction).<br>Read more on [how to create an asset](#issue-transaction). | `GSFk5Ziwx33g8KuMyh6wYerxJcHXdcGgXFiBYXH58AE6`|

### Example ###

<CodeBlock>

```js
```
```java
// Create a burn transaction
BurnTransaction tx = new BurnTransaction(
        senderPublicKey,
        new Amount(1000, assetId)
).addProof(senderPrivateKey);
// Broadcast the transaction to a node and wait for it to be included in the blockchain
node.waitForTransaction(node.broadcast(tx).id());
// Get information about the transaction from a node
BurnTransactionInfo txInfo = node.getTransactionInfo(tx.id(), BurnTransactionInfo.class);
```
```php
```
```csharp
```
```go
const waves = 100_000_000

func main() {
    // Current time in milliseconds
    ts := uint64(time.Now().UnixMilli())
    // Create the asset ID from a string
    assetID, err := crypto.NewDigestFromBase58("<your-asset-id-base58>")
    if err != nil {
        panic(err)
    }
    // Create a Burn transaction
    tx := proto.NewUnsignedBurnWithProofs(3, proto.TestNetScheme, pk, assetID, 500_00, ts, 1*waves)
    // Sing the transaction with the private key
    err = tx.Sign(proto.TestNetScheme, sk)
    if err != nil {
        panic(err)
    }
    // Create a new HTTP client to broadcast the transaction to public TestNet nodes
    cl, err := client.NewClient(client.Options{BaseUrl: "https://testnodes.wavesnodes.com", Client: &http.Client{}})
    if err != nil {
        panic(err)
    }
    // Context to cancel the request execution on timeout
    ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
    defer cancel()
    // Broadcast the transaction to the network
    _, err = cl.Transactions.Broadcast(ctx, tx)
    if err != nil {
        panic(err)
    }
} 
```
```python
```

</CodeBlock>

## Set asset script transaction ##

### Description ###

The set asset script transaction replaces an [asset's script](https://docs.waves.tech/en/ride/script/script-types/asset-script#asset-script-format) (an asset with a script is called a [smart asset]()). Only the token issuer can perform an asset script transaction. If a token is issued without a script, then no script can be assigned to it later. It is also impossible to remove the script and turn a [smart asset]() into a regular one.

<Message type="warning">

The minimum fee for a set asset script transaction is 1 WAVES.
</Message>

Read more about [Set asset script transaction](https://docs.waves.tech/en/blockchain/transaction-type/set-asset-script-transaction).

### Attributes ###

| Arguement | Description | Example |
| :--- | :--- | :--- |
| assetId | Token ID base58 encoded.<br>Read more on [how to create an asset](#issue-transaction). | `7qJUQFxniMQx45wk12UdZwknEW9cDgvfoHuAvwDNVjYv` |
| script | Compiled [asset script](https://docs.waves.tech/en/ride/script/script-types/asset-script), up to 8192 bytes, base64 encoded. Read more about [smart assets](). | `base64:AQa3b8tH` |

### Example ###

<CodeBlock>

```js
```
```java
// Create a set asset script transaction
SetAssetScriptTransaction tx = new SetAssetScriptTransaction(
    senderPublicKey,
    assetId,
    script
).addProof(senderPrivateKey);
// Broadcast the transaction to a node and wait for it to be included in the blockchain
node.waitForTransaction(node.broadcast(tx).id());
// Get information about the transaction from a node
SetAssetScriptTransactionInfo txInfo = node.getTransactionInfo(tx.id(), SetAssetScriptTransactionInfo.class);
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

## Sponsor fee transaction ##

### Description ###

The sponsor fee transaction enables or disables sponsorship. Sponsorship allows any sender to pay a fee in the sponsored asset (instead of WAVES) for [invoke script transactions]() and [transfer transactions](). Only the asset issuer can set up a sponsorship. A [smart asset]() cannot be a sponsored asset.

To understand the concept of the sponsor fee transaction, we can recall that performing any transaction on the Waves blockchain is not free, and there is always a low-cost fee (for most transactions, the minimum fee is 0.001 WAVES). Let's imagine a scenario where paying a transaction fee would become unnecessary. A developer [created an asset](#issue-transaction), called SAMPLE, where he enabled sponsorship, so every user who wishes to operate with that asset will not need to pay fees in WAVES. The developer gave away 100 SAMPLE to a random user. If the user transfers this token from his account to another, he will not pay the fee for the transfer in WAVES. Instead, he will pay a fee in the sponsored asset, SAMPLE, and the asset creator will pay the fee equivalent in WAVES for this token transfer. 

![](./img/sponsorship.png)

<Message type="warning">

The minimum fee for a sponsor fee transaction is 0.001 WAVES. If the transaction sender is a [dApp]() or [smart account](), and the [complexity](https://docs.waves.tech/en/ride/base-concepts/complexity) of the [account script](https://docs.waves.tech/en/ride/script/script-types/account-script) or [dApp script verifier function](https://docs.waves.tech/en/ride/functions/verifier-function) exceeds the [sender complexity threshold](https://docs.waves.tech/en/ride/limits/), the minimum fee is increased by 0.004 WAVES.
</Message>

Read more about [Sponsor fee transaction](https://docs.waves.tech/en/blockchain/transaction-type/sponsor-fee-transaction).

### Attributes ###

| Arguement | Description | Example |
| :--- | :--- | :--- |
| assetId | Token ID base58 encoded.<br>Read more on [how to create an asset](#issue-transaction). | `p1vuxnGyfH9VFiuyKmsh25rn6MedjGbQu7d6Zt1sY4U` |
| minSponsoredAssetFee | Amount of asset that is equivalent to 0.001 WAVES (100,000 WAVELET):<br>an integer value specified in the minimum fraction (“cents”) of asset.<br>null – disable sponsorship. | 5 |

### Example ###

<CodeBlock>

```js
```
```java
// Create a sponsor fee transaction
SponsorFeeTransaction tx = new SponsorFeeTransaction(
    senderPublicKey,
    assetId,
    5
).addProof(senderPrivateKey);
// Broadcast the transaction to a node and wait for it to be included in the blockchain
node.waitForTransaction(node.broadcast(tx).id());
// Get information about the transaction from a node
SponsorFeeTransactionInfo txInfo = node.getTransactionInfo(tx.id(), SponsorFeeTransactionInfo.class);
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