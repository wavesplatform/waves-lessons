- [Smart account definition](#smart-account-definition)
- [Usage examples](#usage-examples)
  - [`Selling or buying only BTC`](#selling-or-buying-only-btc)
  - [`Purchase of an asset`](#purchase-of-an-asset)
- [Setting a smart account script](#setting-a-smart-account-script)
  - [Requirements](#requirements)
  - [Limitations](#limitations)
  - [Set script transaction](#set-script-transaction)

---

## Smart account definition ##

On the Waves platform, it is possible to create a regular account.  
With a regular account, you can send any transactions manually.  
The only verification completed automatically is checking that the transaction was indeed sent from this account.  
For example, sending money from one wallet to another.   
Auto-verification will check if this transaction was truly initiated by the account owner and if he has an available balance.  
  
A smart account is an account that has an add-on verifying that an issued transaction satisfied all conditions of the script.  
For example, sending money from one wallet to another only if the account balance is not less than 20 WAVES.  
Therefore an account that contains a script that checks all outgoing transactions whether they meet all requirements or not is called a smart account.  
  
A smart account's script can contain one or many different functions (sets of rules).  
Only in case that a transaction met the requirements of all the functions of the script, it can be permitted.  
The possible result of the smart account's script compilation can be:

- **<ins>Permitted transaction</ins>**;
- **<ins>Declined transaction</ins>**;
- **<ins>Error of compilation</ins>**.

There is also another type of account script, called [dApp](#linktothedapplesson).  
A dApp works with incoming transactions, meanwhile, a smart account operates with outgoing transactions.  
We will talk about dApps in the [next lesson](#dapplessonlink).

Read more about [Smart Account](https://docs.waves.tech/en/building-apps/smart-contracts/what-is-smart-account).

---

## Usage examples ##

The examples will be written in the [Ride programming language](https://docs.waves.tech/en/ride/).  
In the topic [Programming on RIDE]() basics of the language will be described.

### `Selling or buying only BTC` ###

An account with the script below can make sales transactions only in relation to BTC:  
```ride
{-# STDLIB_VERSION 6 #-}
{-# CONTENT_TYPE EXPRESSION #-}
{-# SCRIPT_TYPE ACCOUNT #-}

let cooperPubKey = base58'BVqYXrapgJP9atQccdBPAgJPwHDKkh6A8'
let BTCId = base58'8LQW8f7P5d5PZM7GtZEBgaqRPGSzS3DfPuiXrURJ4AJS'
match tx {
   case o: Order =>
      sigVerify(o.bodyBytes, o.proofs[0], cooperPubKey ) && 
      (o.assetPair.priceAsset == BTCId || o.assetPair.amountAsset == BTCId)
   case _ => sigVerify(tx.bodyBytes, tx.proofs[0], cooperPubKey )
}
```

### `Purchase of an asset` ###

The script below allows making purchases from your account only:

- With a given asset;
- With a given price;
- With the WAVES token.

```ride
{-# STDLIB_VERSION 6 #-}
{-# CONTENT_TYPE EXPRESSION #-}
{-# SCRIPT_TYPE ACCOUNT #-}

let myAssetId = base58'8LQW8f7P5d5PZM7GtZEBgaqRPGSzS3DfPuiXrURJ4AJS'
let cooperPubKey = base58'BVqYXrapgJP9atQccdBPAgJPwHDKkh6A8'
  
match tx {
   case o: Order =>
      sigVerify(o.bodyBytes, o.proofs[0], cooperPubKey ) && 
      o.assetPair.priceAsset == null && 
      o.assetPair.amountAsset == myAssetId && 
      o.price == 500000 && o.amount == 1000 && 
      o.orderType == Buy
   case _ => sigVerify(tx.bodyBytes, tx.proofs[0], cooperPubKey )
}
```

---

## Setting a smart account script ##

### Requirements ###

To make your account a smart account, send a [set script transaction](#setting-script-transaction).  
The transaction fee for setting the script is 0.01 WAVES.

### Limitations ###

Any account may have only one script attached to it.  
“Detaching” a script from a smart account or replacing it with a new one is possible only if the "old" script doesn't forbid it.   

### Set script transaction ###

There are 2 major ways of smart account script installation:
- [Waves IDE](#wavesidechapterreference):
    1. Open the [Waves IDE](https://waves-ide.com/) with a signed-in account;
    2. Click "+" in the right corner of the IDE, select "Account script":
    ![](./images/smartac_1.png)
    3. Write the Ride script code and click "Deploy":
    ![](./images/smartac_2.png)
    4. Select the account and the tool that you would sign this [transaction](https://docs.waves.tech/en/blockchain/transaction-type/set-script-transaction) with.  
      After this, publish the smart account script.  
      ![](./images/smartac_3.png)
    5. As a result of a succesful operation, you will see a similar notification:  
      ![](./images/smartac_4.png)

  
- [Client libraries](#XII.Libraries):  
    1. Prepare your smart account ride script:
         ```
         {-# STDLIB_VERSION 5 #-}
         {-# CONTENT_TYPE EXPRESSION #-}
         {-# SCRIPT_TYPE ACCOUNT #-}

         sigVerify(tx.bodyBytes, tx.proofs[0], tx.senderPublicKey)
         ```
    2. Use your native programming language to:
         -  Insert the ride script as an arguement of the compileScript function;
         -  Send this transaction to the node.  
            (Read more about [creating and broadcasting transactions](https://docs.waves.tech/en/building-apps/how-to/basic/transaction))
            
           
         
         This is how it can be done:   
         ```js
         ```
         ```Java
         // Necessary imports
         import com.wavesplatform.transactions.common.Base64String;
         import com.wavesplatform.transactions.SetScriptTransaction;

         // Transforming the ride script to a base64 string
         // Make sure to insert your ride script between the brackets below
         Base64String script = node.compileScript("{-# SCRIPT_TYPE ACCOUNT #-} true").script();
         SetScriptTransaction tx = SetScriptTransaction.builder(script).getSignedWith(alice);
            
         // Sending the transaction to the node
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

         **Parameters Description**
         | Field | Description | Example |
         | ----------- | ----------- | ----------- |
         | script | Compiled script, base64 encoded.<br>Account script up to 8192 bytes.<br>null — delete script| [Example](https://docs.waves.tech/en/blockchain/transaction-type/set-script-transaction#json-representation:~:text=%22script%22%3A,%22base64%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%3D%3D%22)|

           

          More about [Set Script Transaction](https://docs.waves.tech/en/blockchain/transaction-type/set-script-transaction).

  

The next lesson will be dedicated to [dApp](), another type of an account script.
