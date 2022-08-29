- [Asset definition](#asset-definition)
- [Operations with assets](#operations-with-assets)
  - [Asset creation](#asset-creation)
  - [NFT creation](#nft-creation)


## Asset definition ##

An asset (or a token) is a digital resource that can be used as:
- **<u>Cryptocurrency</u>**:  
        Aside from the main Waves blockchain cryptocurrency, WAVES, you can create your own cryptocurrency.
        If you manage to promote your token in the market, it can become a valuable currency. 
        To give a hint on how to make your currency valuable, take a look at dollars.
        Why do we use dollars and think of them as of something that has a value?
        Why, at the same time, do we never use leaves from trees as a currency, though it may have a relatively the same composition?
        Dollars managed to be credited to accounts of many different holders, and the holders had no other goal but to use these dollars.
        As people searched for ways to use dollars, they started exchanging them for goods and services.
        The more people and the more frequent dollars are used, the bigger its value is becoming.
        The rest depends on the currency creator.
- **<u>Object</u>**:  
        An object can be represented as an auxiliatry tool.
        The best way to grasp this idea is to see it working on the live example.
        For instance, you can create a cookery game, using the Waves blockchain as your database.
        The goal of the game is recipes generation.
        Every account of the game is a Waves blockchain [account]().
        To generate a recipe, you spin a wheel and receive a reward recipe.
        Every wheel spin costs one [token that we created](#asset-creation).
        All users can receive three free tokens every 24 hours.
        Here we use tokens that we created on the Waves blockchain as an object in the game that we created.

Therefore, we can make a conclusion that an asset can be either a cryptocurrency or an object within your program.
If you wish to become an owner of a new cryptocurrency or use an asset as a ready solution for your project, you can [create it](#asset-creation) in the Waves blockchain.

In the topic [How the Waves works](), we covered the lesson on smart assets, [What is a smart asset, and how to create it]().
That lesson was a simple particular demonstration of what a smart asset is and how it could be created. The difference between a regular asset and a smart asset is that a smart asset has an additional configuration, defining rules of work of the asset. 

## Operations with assets ##

This chapter will distinguish operations with assets among many possible actions on the Waves blockchain.   
All operations with assets can be groupped by two categories:
- **<u>Transactions</u>**   
    Out of [various transaction types](https://docs.waves.tech/en/blockchain/transaction-type/), there are approximately six of them that are related to assset. The lesson [Work with assets]() will be dedicated to all transactions interacting with assets.
- **<u>REST API methods</u>**   
    As well, it is possible to interact with REST API methods to get some information about assets, for example:
    * **GET** `/assets/{assetId}/distribution/{height}/limit/{limit}`
        Get asset balance distribution by [account]() addresses at a given height. The maximum number of addresses is set by `waves.rest-api.distribution-address-limit` (read more about [node rest api configruations](https://docs.waves.tech/en/waves-node/node-configuration#rest-api-settings)), 1000 by default. For pagination, use the field `{after}`.
    * **GET** `/assets/balance/{address}`  
        Get account balances in all or specified assets (excluding WAVES) at a given address. Please, note, the full portfolio also excludes [NFTs](#nft-creation).
    * **GET** `/assets/balance/{address}/{assetId}`  
        Get the account balance of a given asset.
    * **GET** `/assets/details/{assetId}`  
        Get detailed information about a given asset.
    * **GET** `/assets/nft/{address}/limit/{limit}`  
        Get a list of non-fungible tokens at a given address. Maximum for 1000 tokens. For pagination, use the field `{after}`.

In this lesson, we will demonstrate an instance of the asset operations with an [Asset creation](#asset-creation) and an [NFT creation](#nft-creation). 

## Asset creation ##


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
        // create a node instance
        Node node = new Node(Profile.TESTNET);
        // create private key from seed
        PrivateKey privateKey = PrivateKey.fromSeed("seed phrase");
        // create IssueTransaction
        IssueTransaction tx = new IssueTransaction(
                privateKey.publicKey(),
                "asset", 
                "description", 
                1000, 
                2, 
                false,
                null) 
                .addProof(privateKey); 
        // publish the transaction and wait for it to be included in the blockchain
        node.waitForTransaction(node.broadcast(tx).id());
        // get transaction info from node
        IssueTransactionInfo txInfo = node.getTransactionInfo(tx.id(), IssueTransactionInfo.class);
        // print all information
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
    // Create sender's private key from BASE58 string
    sk, err := crypto.NewSecretKeyFromBase58("<your-private-key>")
    if err != nil {
        panic(err)
    }
    // Generate public key from secret key
    pk := crypto.GeneratePublicKey(sk)
    // Current time in milliseconds
    ts := uint64(time.Now().UnixMilli())
    // New Issue Transaction
    tx := proto.NewUnsignedIssueWithProofs(3, proto.TestNetScheme, pk, "asset", "description",
        1000_00, 2, true, nil, ts, 1*waves)
    // Sing the transaction with the private key
    err = tx.Sign(proto.TestNetScheme, sk)
    if err != nil {
        panic(err)
    }
    // Create new HTTP client to send the transaction to public TestNet nodes
    cl, err := client.NewClient(client.Options{BaseUrl: "https://testnodes.wavesnodes.com", Client: &http.Client{}})
    if err != nil {
        panic(err)
    }
    // Context to cancel the request execution on timeout
    ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
    defer cancel()
    // Send the transaction to the network
    _, err = cl.Transactions.Broadcast(ctx, tx)
    if err != nil {
        panic(err)
    }
} 
```
```python
```

</CodeBlock>

## NFT creation ##

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
        // create a node instance
        Node node = new Node(Profile.TESTNET);
        // create private key from seed
        PrivateKey privateKey = PrivateKey.fromSeed("seed phrase");
        // create IssueTransaction (non-fungible token, NFT): quantity=1, decimals=0, reissuable=false
        IssueTransaction tx = new IssueTransaction(
                privateKey.publicKey(),
                "some NFT", 
                "nft example", 
                1, 
                0, 
                false,
                null) 
                .addProof(privateKey); 
        // publish the transaction and wait for it to be included in the blockchain
        node.waitForTransaction(node.broadcast(tx).id());
        // get transaction info from node
        IssueTransactionInfo txInfo = node.getTransactionInfo(tx.id(), IssueTransactionInfo.class);
        // print all information
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
    // Create sender's private key from BASE58 string
    sk, err := crypto.NewSecretKeyFromBase58("<your-private-key>")
    if err != nil {
        panic(err)
    }
    // Generate public key from secret key
    pk := crypto.GeneratePublicKey(sk)
    // Current time in milliseconds
    ts := uint64(time.Now().UnixMilli())
    // New Issue Transaction
    tx := proto.NewUnsignedIssueWithProofs(3, proto.TestNetScheme, pk, "some NFT", "nft example",
        1, 0, false, nil, ts, 1*waves)
    // Sing the transaction with the private key
    err = tx.Sign(proto.TestNetScheme, sk)
    if err != nil {
        panic(err)
    }
    // Create new HTTP client to send the transaction to public TestNet nodes
    cl, err := client.NewClient(client.Options{BaseUrl: "https://testnodes.wavesnodes.com", Client: &http.Client{}})
    if err != nil {
        panic(err)
    }
    // Context to cancel the request execution on timeout
    ctx, cancel := context.WithTimeout(context.Background(), 10*time.Second)
    defer cancel()
    // Send the transaction to the network
    _, err = cl.Transactions.Broadcast(ctx, tx)
    if err != nil {
        panic(err)
    }
} 
```
```python
```

</CodeBlock>