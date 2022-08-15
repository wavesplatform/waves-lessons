## Smart asset description ##

On the Waves platform, it is possible to issue your token.  
You can give it a name and promote it, making the token a valuable currency.  
Issuing a token is [one of the transaction types]() made on the blockchain.  
All the tokens can be either regular assets or smart assets.  

A smart asset is an asset to which a script is attached.  
It is one of 3 types of [smart contracts](https://docs.waves.tech/en/building-apps/smart-contracts/waves-smart-contracts-overview) along with [dApp]() and [smart account]().  
Using an asset script allows a transaction with that asset or rejects it.  

For example, we may create a smart asset with a script that blocks operations with this asset for specific users.  

There are three different possible results of the asset script invocation:

- **<u>Permitted transaction</u>**:  
  The transaction is permitted, and all the script conditions are satisfied.  
  This transaction will be included in the blockchain, and the [fee](https://docs.waves.tech/en/building-apps/smart-contracts/what-is-smart-asset#smart-asset-fees) for asset script invocation will be charged.
- **<u>Declined transaction</u>**:  
  The asset script invocation found incompatibility with the conditions, leading to the rejection of the transaction.  
  In such a case, the fee for asset script invocation will be charged, and the transaction will be marked as rejected in the blockchain.
- **<u>Error of compilation</u>**:  
  An error in the script compilation occurred, and the transaction was declined.  
  No fee will be charged, and the transaction will not appear in the blockchain.  

Read more about [smart asset](https://docs.waves.tech/en/building-apps/smart-contracts/what-is-smart-asset).

## Usage examples ##

All of the possible usage scenarios depend on the ingenuity of the asset creator.  
We will demonstrate very few basic examples for the sake of simplicity.  
These examples will be written in the [Ride programming language](https://docs.waves.tech/en/ride/).  
The topic [Programming on RIDE]() will describe the basics of the language.  

### Token usage freeze ###

Once there is a certain height of the blockchain (1610000 blocks), disable all operations with the smart asset. 

<CodeBlock>

```ride
{-# STDLIB_VERSION 6 #-}
{-# CONTENT_TYPE EXPRESSION #-}
{-# SCRIPT_TYPE ASSET #-}

let targetHeight = 1610000
height >= targetHeight
```

</CodeBlock>

### Unburnable token ###

Make the asset unburnable, i.e., impossible to have the token amount reduced or the token to be destroyed.   

<CodeBlock>

```ride
{-# STDLIB_VERSION 6 #-}
{-# CONTENT_TYPE EXPRESSION #-}
{-# SCRIPT_TYPE ASSET #-}

match tx {
  case t : BurnTransaction => false
   case _ => true
}
```

</CodeBlock>

More about [Burn transaction](https://docs.waves.tech/en/blockchain/transaction-type/burn-transaction).  

## Setting an asset script ##

### Requirements ###
To create a smart asset, it is necessary:

- Send an [Issue transaction](https://docs.waves.tech/en/blockchain/transaction-type/issue-transaction) of version 2 or higher;
- Include a script in base64 encoding in the issue transaction.

Please, note that the minimum fee for this transaction is 1 WAVES.  

### Limitations ###
There are two crucial limitations when working with smart asset creation is

- **<u>Inability to change asset type:</u>**  
  Creating a smart asset is possible at the moment of token creation.  
  If you create a token with no script, it will not be possible to attach a script to it later.  
  Similarly, if a token is created as a smart asset, it will always stay a smart asset with the possibility to change the script at any time.  
  If you do not have any ready scripts, you can write a simple script that always returns `true` and change it later.   
- **<u>A smart asset cannot be sponsored:</u>**  
  Read more about [Fee in sponsored asset](https://docs.waves.tech/en/blockchain/transaction/transaction-fee#fee-in-sponsored-asset).


### Writting a smart asset script ###

There are two main steps to installing a smart asset script:
1. Prepare the ride script you would like to install on an asset:   

    <CodeBlock>

    ```ride
    {-# STDLIB_VERSION 6 #-}
    {-# CONTENT_TYPE EXPRESSION #-}
    {-# SCRIPT_TYPE ASSET #-}

    func trueReturner () = {
        return true
    }
    ```

    </CodeBlock>

2. Afterward, it would be necessary to prepare a script in your native programming language that would:  

    - Create an asset;
    - Attach a smart account script to it;
    - Send the transaction to the node.

    Here is how to make this:  

    <CodeBlock>

    ```js
    ```
    ```java
    // Necessary imports
    import com.wavesplatform.transactions.common.AssetId;
    import com.wavesplatform.transactions.common.Base64String;
    import com.wavesplatform.transactions.IssueTransaction;
    import com.wavesplatform.transactions.SetAssetScriptTransaction;

    // Transforming the ride script to a base64 string
    // Make sure to insert your ride script between the brackets below
    Base64String script = node.compileScript("INSERT YOUR DAPP SCRIPT HERE")
            .script();

    // Creation of a token and installation of the compiled script on it
    AssetId assetId = node.waitForTransaction(
            node.broadcast(IssueTransaction.builder("Asset", 1000, 2)
            .script(script)
            .getSignedWith(alice)).id(), IssueTransactionInfo.class)
            .tx().assetId();
    SetAssetScriptTransaction tx = SetAssetScriptTransaction.builder(assetId, script).getSignedWith(alice);

    // Sending transaction to the node
    node.waitForTransaction(node.broadcast(tx).id());
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

    **Parameters Description**
    | Field | Description | Example |
    | --- | --- | --- |
    | assetId | Token ID base58 encoded. | 7qJUQFxniMQx45wk12UdZwknEW9cDgvfoHuAvwDNVjYv |
    | script | Compiled asset script, up to 8192 bytes, base64 encoded. | base64:AQa3b8tH |
  
In the next lesson, we will discuss another type of smart contract, called [smart account]().  