## Transactions of work with assets ##  

As we mentioned in [Transaction types]() of the lesson [Transaction definition and work with transactions](), there are six transactions types that can be classified as transactions intended for work with assets:
- [Issue transaction](#issue-transaction)  
- [Reissue transaction](#reissue-transaction)  
- [Update asset info transaction](#update-asset-info-transaction)  
- [Burn transaction](#burn-transaction)  
- [Set asset script transaction](#set-asset-script-transaction)  
- [Sponsor fee transaction](#sponsor-fee-transaction)

Within this lesson, we will describe these transaction types in detail. Firstly, we will discuss what a transaction is intended for. Secondly, transaction attributes will be explained. Lastly, a demonstration of how this transaction is created in different programming languages (Javascript, Java, PHP, C#, Go, Python) will be given.

## Issue transaction ##

### Description ###

The issue transaction is intended for issuing a new token on the Waves blockchain. As per [Asset creation and operation with assets](), we mentioned two different purposes for creating a new token within the blockchain: a new token as a cryptocurrency or as an object. 

The minimum fee for an issue transaction is 1 WAVES, in case of issue of a non-fungible token (NFT) 0.001 WAVES. Read more about [Issue transaction](https://docs.waves.tech/en/blockchain/transaction-type/issue-transaction).

### Attributes ###

### Transaction example ###


<CodeBlock>

```js
```
```java
package com.wavesplatform.examples;
import com.wavesplatform.transactions.account.PrivateKey;
import com.wavesplatform.transactions.IssueTransaction;
import com.wavesplatform.wavesj.Node;
import com.wavesplatform.wavesj.Profile;
import com.wavesplatform.wavesj.exceptions.NodeException;
import com.wavesplatform.wavesj.info.IssueTransactionInfo;
import java.io.IOException;

public class WavesExample {
    public static void main(String[] args) throws NodeException, IOException {
        // Create a node instance
        Node node = new Node(Profile.TESTNET);
        // Create the private key from a seed
        PrivateKey privateKey = PrivateKey.fromSeed("seed phrase");
        // Create an Issue transaction
        IssueTransaction tx = new IssueTransaction(
                privateKey.publicKey(),
                "sampleasset", 
                "description of the asset", 
                1000, 
                2, 
                false,
                null) 
                .addProof(privateKey); 
        // Broadcast the transaction and wait for it to be included in the blockchain
        node.waitForTransaction(node.broadcast(tx).id());
        // Get the transaction info from a node
        IssueTransactionInfo txInfo = node.getTransactionInfo(tx.id(), IssueTransactionInfo.class);
        // Pritn all the information
        System.out.println("type:" + txInfo.tx().type());
        System.out.println("id:" + txInfo.tx().id());
        System.out.println("fee:" + txInfo.tx().fee().value());
        System.out.println("feeAssetId:" + txInfo.tx().fee().assetId().encoded());
        System.out.println("timestamp:" + txInfo.tx().timestamp());
        System.out.println("version:" + txInfo.tx().version());
        System.out.println("chainId:" + txInfo.tx().chainId());
        System.out.println("sender:" + txInfo.tx().sender().address().encoded());
        System.out.println("senderPublicKey:" + txInfo.tx().sender().encoded());
        System.out.println("proofs:" + txInfo.tx().proofs());
        System.out.println("assetId:" + txInfo.tx().assetId().encoded());
        System.out.println("name:" + txInfo.tx().name());
        System.out.println("quantity:" + txInfo.tx().quantity());
        System.out.println("reissuable:" + txInfo.tx().reissuable());
        System.out.println("decimals:" + txInfo.tx().decimals());
        System.out.println("description:" + txInfo.tx().description());
        System.out.println("script:" + txInfo.tx().script().encoded());
        System.out.println("height:" + txInfo.height());
        System.out.println("applicationStatus:" + txInfo.applicationStatus());
    }
}
```
```php
```
```csharp
```
```go
package main

import (
    "context"
    "net/http"
    "time"
    "github.com/wavesplatform/gowaves/pkg/client"
    "github.com/wavesplatform/gowaves/pkg/crypto"
    "github.com/wavesplatform/gowaves/pkg/proto"
)

const waves = 100_000_000

func main() {
    // Create the sender's private key from a BASE58 string
    sk, err := crypto.NewSecretKeyFromBase58("<your-private-key>")
    if err != nil {
        panic(err)
    }
    // Generate the public key from the private key
    pk := crypto.GeneratePublicKey(sk)
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

## Reissue transaction ##

### Description ###

The reissue transaction aims to increase the amount of a token that was created via [Issue transaction](#issue-transaction). Only the token issuer can perform a reissue transaction. The additional amount of token increases the balance of the transaction sender. As well, it is possible to make your token non-reissuable, which would limit the amount of a token in the blockchain.

The minimum fee for a reissue transaction is 0.001 WAVES. Read more about [Reissue transaction](https://docs.waves.tech/en/blockchain/transaction-type/reissue-transaction).

### Attributes ###

### Transaction example ###

<CodeBlock>

```js
```
```java
package com.wavesplatform.examples;
import com.wavesplatform.transactions.ReissueTransaction;
import com.wavesplatform.transactions.account.PrivateKey;
import com.wavesplatform.transactions.IssueTransaction;
import com.wavesplatform.transactions.common.Amount;
import com.wavesplatform.transactions.common.AssetId;
import com.wavesplatform.transactions.common.Base64String;
import com.wavesplatform.wavesj.Node;
import com.wavesplatform.wavesj.Profile;
import com.wavesplatform.wavesj.exceptions.NodeException;
import com.wavesplatform.wavesj.info.IssueTransactionInfo;
import com.wavesplatform.wavesj.info.ReissueTransactionInfo;
import java.io.IOException;

public class WavesExample {
    public static void main(String[] args) throws NodeException, IOException {
        // Create a node instance
        Node node = new Node(Profile.TESTNET);
        // Create the private key from a seed
        PrivateKey privateKey = PrivateKey.fromSeed("seed phrase");
        // Create an Issue transaction
        IssueTransaction tx = new IssueTransaction(
                privateKey.publicKey(),
                "asset",
                "description",
                1000,
                2,
                true,
                Base64String.empty())
                .addProof(privateKey);
        // Get the asset id of the created transaction
        AssetId assetId = node.waitForTransaction(node.broadcast(tx).id(), IssueTransactionInfo.class).tx().assetId();
        // Create a Reissue transaction
        ReissueTransaction rtx = new ReissueTransaction(
                privateKey.publicKey(),
                Amount.of(1000, assetId),
                true
        ).addProof(privateKey);
        // Broadcast the transaction and wait for it to be included in the blockchain
        node.waitForTransaction(node.broadcast(rtx).id());
        // Get the transaction info from a node
        ReissueTransactionInfo txInfo = node.getTransactionInfo(rtx.id(), ReissueTransactionInfo.class);
        // Print all the information
        System.out.println("type:" + txInfo.tx().type());
        System.out.println("id:" + txInfo.tx().id());
        System.out.println("fee:" + txInfo.tx().fee().value());
        System.out.println("feeAssetId:" + txInfo.tx().fee().assetId().encoded());
        System.out.println("timestamp:" + txInfo.tx().timestamp());
        System.out.println("version:" + txInfo.tx().version());
        System.out.println("chainId:" + txInfo.tx().chainId());
        System.out.println("sender:" + txInfo.tx().sender().address().encoded());
        System.out.println("senderPublicKey:" + txInfo.tx().sender().encoded());
        System.out.println("proofs:" + txInfo.tx().proofs());
        System.out.println("assetId:" + txInfo.tx().amount().assetId().encoded());
        System.out.println("quantity:" + txInfo.tx().amount().value());
        System.out.println("reissuable:" + txInfo.tx().reissuable());
        System.out.println("height:" + txInfo.height());
        System.out.println("applicationStatus:" + txInfo.applicationStatus());
    }
} 
```
```php
```
```csharp
```
```go
package main

import (
    "context"
    "net/http"
    "time"
    "github.com/wavesplatform/gowaves/pkg/client"
    "github.com/wavesplatform/gowaves/pkg/crypto"
    "github.com/wavesplatform/gowaves/pkg/proto"
)

const waves = 100_000_000

func main() {
    // Create the sender's private key from a BASE58 string
    sk, err := crypto.NewSecretKeyFromBase58("<your-private-key>")
    if err != nil {
        panic(err)
    }
    // Generate the public key from the private key
    pk := crypto.GeneratePublicKey(sk)
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

## Update asset info transaction ##

### Description ###

The update asset info transaction updates the name or the description of a token. Only the token issuer can perform a update asset info transaction.  
The token name and/or description can be changed in [different networks]():
- **<u>Mainnet and Testnet</u>**:  
    After 100,000 or more blocks from the last change (or the token issue);
- **<u>Stagenet</u>**:  
    After 10 or more blocks.
The average time of a block creation is approximately one minute.

The minimum fee for an update asset info transaction is 0.001 WAVES, in case of a smart asset 0.005 WAVES. Read more about [Update asset info transaction](https://docs.waves.tech/en/blockchain/transaction-type/update-asset-info-transaction).

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

## Burn transaction ##

### Description ###

The burn transaction decreases the amount of a token on the sender's account and thereby the total amount of the token on the blockchain. Any account that owns a token (not necessarily the token issuer) can perform a burn transaction. Burned tokens cannot be restored back to the account.

The minimum fee for a burn transaction is 0.001 WAVES, in case of burning a smart asset 0.005 WAVES. Read more about [Burn transaction](https://docs.waves.tech/en/blockchain/transaction-type/burn-transaction).

### Attributes ###

### Transaction example ###

<CodeBlock>

```js
```
```java
package com.wavesplatform.examples;
import com.wavesplatform.transactions.BurnTransaction;
import com.wavesplatform.transactions.account.PrivateKey;
import com.wavesplatform.transactions.IssueTransaction;
import com.wavesplatform.transactions.common.Amount;
import com.wavesplatform.transactions.common.AssetId;
import com.wavesplatform.transactions.common.Base64String;
import com.wavesplatform.wavesj.Node;
import com.wavesplatform.wavesj.Profile;
import com.wavesplatform.wavesj.exceptions.NodeException;
import com.wavesplatform.wavesj.info.BurnTransactionInfo;
import com.wavesplatform.wavesj.info.IssueTransactionInfo;
import java.io.IOException;

public class WavesExample {
    public static void main(String[] args) throws NodeException, IOException {
        // Create a node instance
        Node node = new Node(Profile.TESTNET);
        // Create the private key from a seed
        PrivateKey privateKey = PrivateKey.fromSeed("seed phrase");
        // Create an Issue transaction
        IssueTransaction tx = new IssueTransaction(
                privateKey.publicKey(),
                "asset",
                "description",
                1000,
                2,
                true,
                Base64String.empty())
                .addProof(privateKey);
        // Get the asset id of the created transaction
        AssetId assetId = node.waitForTransaction(node.broadcast(tx).id(), IssueTransactionInfo.class).tx().assetId();
        // Create a Burn transaction
        BurnTransaction btx = new BurnTransaction(
                privateKey.publicKey(),
                new Amount(100, assetId)
        ).addProof(privateKey);
        // Broadcast the transaction and wait for it to be included in the blockchain
        node.waitForTransaction(node.broadcast(btx).id());
        // Get transaction info from a node
        BurnTransactionInfo txInfo = node.getTransactionInfo(btx.id(), BurnTransactionInfo.class);
        // Print all the information about transaction
        System.out.println("type:" + txInfo.tx().type());
        System.out.println("id:" + txInfo.tx().id());
        System.out.println("fee:" + txInfo.tx().fee().value());
        System.out.println("feeAssetId:" + txInfo.tx().fee().assetId().encoded());
        System.out.println("timestamp:" + txInfo.tx().timestamp());
        System.out.println("version:" + txInfo.tx().version());
        System.out.println("chainId:" + txInfo.tx().chainId());
        System.out.println("sender:" + txInfo.tx().sender().address().encoded());
        System.out.println("senderPublicKey:" + txInfo.tx().sender().encoded());
        System.out.println("proofs:" + txInfo.tx().proofs());
        System.out.println("assetId:" + txInfo.tx().amount().assetId().encoded());
        System.out.println("amount:" + txInfo.tx().amount().value());
        System.out.println("height:" + txInfo.height());
        System.out.println("applicationStatus:" + txInfo.applicationStatus());
    }
}
```
```php
```
```csharp
```
```go
package main

import (
    "context"
    "net/http"
    "time"
    "github.com/wavesplatform/gowaves/pkg/client"
    "github.com/wavesplatform/gowaves/pkg/crypto"
    "github.com/wavesplatform/gowaves/pkg/proto"
)

const waves = 100_000_000

func main() {
    // Create the sender's private key from a BASE58 string
    sk, err := crypto.NewSecretKeyFromBase58("<your-private-key>")
    if err != nil {
        panic(err)
    }
    // Generate the public key from the private key
    pk := crypto.GeneratePublicKey(sk)
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

The set asset script transaction replaces an asset's script. Only the token issuer can perform an asset script transaction. If a token is issued without a script, then no script can be assigned to it later. It is also impossible to remove the script and turn a smart asset into a regular one.

The minimum fee for a set asset script transaction is 1 WAVES. Read more about [Set asset script transaction](https://docs.waves.tech/en/blockchain/transaction-type/set-asset-script-transaction).

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

## Sponsor fee transaction ##

### Description ###

The sponsor fee transaction enables or disables sponsorship. Sponsorship allows any sender to pay a fee in the sponsored asset (instead of WAVES) for [invoke script transactions]() and [transfer transactions](). Only the asset issuer can set up a sponsorship. A smart asset cannot be a sponsored asset.

To understand the concept of the sponsor fee transaction, we can recall that performing any transaction on the Waves blockchain is not free, and there is always a cheap fee (for most transactions, the minimum fee is 0.001 WAVES). Let's imagine a scenario where paying a transaction fee would become unnecessary. A developer created an [asset](#issue-transaction), called SAMPLE, where he enabled sponsorship, so every user who wishes to operate with that asset will not need to pay fees in WAVES. The developer gave away 100 SAMPLE to a random user. If the user transfers this token from his account to another, he will not pay the fee for the transfer in WAVES. Instead, he will pay a fee in the sponsored asset, SAMPLE, and the asset creator will pay the fee equivalent in WAVES for this token transfer. 

![](./img/sponsorship.png)

Read more about [Sponsor fee transaction](https://docs.waves.tech/en/blockchain/transaction-type/sponsor-fee-transaction).

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