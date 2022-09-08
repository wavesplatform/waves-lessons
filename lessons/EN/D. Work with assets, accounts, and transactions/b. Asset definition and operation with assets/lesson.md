## Asset definition ##

An asset (or a token) is a digital resource that can be used as:
- **<u>Cryptocurrency</u>**:  
        Aside from the main Waves blockchain cryptocurrency, WAVES, you can create your own cryptocurrency.
        If you manage to promote your token in the market, it can become a valuable currency. 
        To give a hint on how to make your token valuable, take a look at dollars.
        Why do we use dollars and think of them as of something that has a value?
        Why, at the same time, do we never use leaves from trees as a currency, though it may have a relatively the same composition?
        Dollars managed to be credited to accounts of many different holders, and the holders had no other goal but to use these dollars.
        As people searched for ways to use dollars, they started exchanging them for goods and services.
        The more frequent dollars are used, the bigger its value is becoming.
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
        Here we use tokens that we created on the Waves blockchain as an object in a game.

Therefore, we can make a conclusion that an asset can be either a cryptocurrency or an object within your program.
If you wish to become an owner of a new cryptocurrency or use an asset as a ready solution for your project, you can [create it](#asset-creation) in the Waves blockchain.

In the topic [How the Waves works](), we covered the lesson on smart assets, [What is a smart asset, and how to create it]().
That lesson was a simple particular demonstration of what a smart asset is and how it could be created. The difference between a regular asset and a smart asset is that a smart asset has an additional configuration, defining rules of work of the asset. 

## Operations with assets ##

This chapter will help to distinguish operations with assets among many possible actions on the Waves blockchain.   
All operations with assets can be groupped by two categories:
- **<u>Transactions</u>**:   
    Out of [various transaction types](https://docs.waves.tech/en/blockchain/transaction-type/), there are approximately six of them that are related to interaction with assets:
    * [Issue transaction]()
    * [Reissue transaction]()
    * [Update asset info transaction]()
    * [Burn transaction]()
    * [Set asset script transaction]()
    * [Sponsor fee transaction]()

    The lesson [Work with assets]() will be dedicated to a detailed elaboration of these transactions.
- **<u>Node object methods</u>**:  
    Client libraries offer invoking different node object methods:
    * **`getAssetDistribution`**  
        Get asset balance distribution by [account]() addresses.

        <CodeBlock>

        ```js
        ```
        ```java
        // Specify the assetId and the given height.
        node.getAssetDistribution(assetId, height) 
        // Specify the assetId, the given height and the limit
        node.getAssetDistribution(assetId, height, limit)
        // Specify the assetId, the given height, the limit, and afterAddress
        node.getAssetDistribution(assetId, height, limit, afterAddress) 
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
    * **`getAssetsBalance`**
        Get account balances in all or specified assets (excluding WAVES) at a given address. 
        
        <CodeBlock>

        ```js
        ```
        ```java
        // Get information about the account balance by a given address
        node.getAssetsBalance(address)
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
    * **`getAssetDetails`**
        Get detailed information about a given asset.
    * **`getNft`**
         Get a list of non-fungible tokens at a given address.

In this lesson, we will demonstrate an instance of the asset operations with an [Asset creation](#asset-creation) and an [NFT creation](#nft-creation). 

## Assets arguments ##

As previously mentioned in [Functions parameters](), every function has a set of arguments passed on. Below you can find the list of arguments necessary to be filled within the [asset creation](#asset-creation) function and with the [NFT creation](#nft-creation), both of which are varieties of different arguements within the [Issue transaction]():

| Arguement | Description | Example |
| :--- | :--- | :--- |
| name | Token name. <br>From 4 to 16 bytes (1 character can take up to 4 bytes).| sampleasset |
| description | Token description. From 0 to 1000 bytes.| description of the asset |
| quantity | Token quantity.<br> An integer value specified in the minimum fraction (“cents”), that is, the real quantity multiplied by 10<sup>decimals</sup>.<br>From 1 to 9,223,372,036,854,775,807.<br>1 for NFT.| 1000 |
| decimals | Number of decimal places, from 0 to 8.<br>0 for NFT.| 2 |
| reissuable | Reissue availability flag, see the [Reissue Transaction]() article.<br>`false` for NFT. | false |
| script | For a smart asset: a compiled asset script, up to 8192 bytes, base64 encoded.<br>For a token without a script: `null`.<br>The token issued without a script cannot be converted to a smart asset. | null |

## Asset creation ##

Asset creation transaction allows creating a regular asset.

<CodeBlock>

```js
```
```java
// Create an Issue transaction
IssueTransaction tx = new IssueTransaction(
        publicKey,
        "sampleasset", 
        "description of the asset", 
        1000, 
        2, 
        false,
        null) 
        .addProof(privateKey); 
// Broadcast the transaction and wait for it to be included in the blockchain
node.waitForTransaction(node.broadcast(tx).id())
```
```php
```
```csharp
```
```go
const waves = 100_000_000

func main() {
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

## NFT creation ##

A non-fungible token or NFT is a particular type of token representing some unique object. The difference between a regular asset and an NFT is that an NFT is an asset with a quantity equal to one that cannot be reissued. 

<CodeBlock>

```js
```
```java
// Create an Issue transaction (non-fungible token, NFT: quantity=1, decimals=0, reissuable=false)
IssueTransaction tx = new IssueTransaction(
        publicKey,
        "sampleasset", 
        "description of the asset", 
        1, 
        0, 
        false,
        null) 
        .addProof(privateKey); 
// Broadcast the transaction and wait for it to be included in the blockchain
node.waitForTransaction(node.broadcast(tx).id());
```
```php
```
```csharp
```
```go
const waves = 100_000_000

func main() {
    // Create an Issue transaction
    tx := proto.NewUnsignedIssueWithProofs(3, proto.TestNetScheme, pk, "sampleasset", "description of the asset",
        1, 0, false, nil, ts, 1*waves)
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

Read more about [NFT](https://docs.waves.tech/en/blockchain/token/non-fungible-token).