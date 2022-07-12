# What is A Smart Account And Setting Account Script #

 - [Smart-Account Definition](#smart-account-definition)
 - [Usage Examples](#usage-examples)
   - [Selling Or Buying Only BTC](#selling-or-buying-only-btc)
   - [Purchase Of A Certain Asset](#purchase-of-a-certain-asset)
 - [Setting A Smart Account Script](#setting-a-dapp-script)
   - [Requirements](#requirements)
   - [Limitations](#limitations)
   - [Set Script Transaction](#set-script-transaction)

---

## Smart Account Definition ##

On the Waves platform, it is possible to create a regular account.<br>
With a regular account, you can send any transactions manually.<br>
The only verification completed automatically is checking that the transaction was indeed sent from this account.<br>
For example, sending money from one wallet to another. <br>
Auto-verification will check if this transaction was truly initiated by the account owner and if he has an available balance.<br>
<br>
A smart account is an account that has an add-on verifying that an issued transaction satisfied all conditions of the script.<br>
For example, sending money from one wallet to another only if the account balance is not less than 20 WAVES.<br>
Therefore an account that contains a script that checks all outgoing transactions whether they meet all requirements or not is called a smart account.<br>
<br>
A smart account's script can contain one or many different functions (sets of rules).<br>
Only in case that a transaction met the requirements of all the functions of the script, it can be permitted.<br>
The possible result of the smart account's script compilation can be:

- **<ins>Permitted transaction</ins>**;
- **<ins>Declined transaction</ins>**;
- **<ins>Error of compilation</ins>**.

There is also another type of account script, called [dApp](#linktothedapplesson).<br>
A dApp works with incoming transactions, meanwhile, a smart account operates with outgoing transactions.<br>
We will talk about dApps in the [next lesson](#dapplessonlink).

Read more about [Smart Account](https://docs.waves.tech/en/building-apps/smart-contracts/what-is-smart-account).

---

## Usage Examples ##

The examples will be written in the [Ride programming language](https://docs.waves.tech/en/ride/).<br>
In the topic [Programming on RIDE]() basics of the language will be described.

### `Selling Or Buying Only BTC` ###

An account with the script below can make sales transactions only in relation to BTC:<br>
```
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

### `Purchase Of A Certain Asset` ###

The script below allows making purchases from your account only:

- With a given asset;
- With a given price;
- With the WAVES token.

```
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

## Setting A Smart Account Script ##

### Requirements ###

To make your account a smart account, send a [set script transaction](#setting-script-transaction).<br>
The transaction fee for setting the script is 0.01 WAVES.

### Limitations ###

Any account may have only one script attached to it.<br>
“Detaching” a script from a smart account or replacing it with a new one is possible only if the "old" script doesn't forbid it. <br>

### Set Script Transaction ###       
Set script transaction attaches an [account script](https://docs.waves.tech/en/ride/script/script-types/account-script) to the sender's account.<br>
More about [Set Script Transaction](https://docs.waves.tech/en/blockchain/transaction-type/set-script-transaction).

```Java
// Necessary imports
import com.wavesplatform.transactions.common.Base64String;
import com.wavesplatform.transactions.SetScriptTransaction;
import com.wavesplatform.wavesj.info.SetScriptTransactionInfo;
import com.wavesplatform.wavesj.info.TransactionInfo;

// Writing an account script to base64 and setting the script on the "alice" address 
Base64String script = node.compileScript("{-# SCRIPT_TYPE ACCOUNT #-} true").script();
SetScriptTransaction tx = SetScriptTransaction.builder(script).getSignedWith(alice);
   
// Sending the transaction to the node
node.waitForTransaction(node.broadcast(tx).id());

// Displaying information about the transaction
TransactionInfo commonInfo = node.getTransactionInfo(tx.id());
SetScriptTransactionInfo txInfo = node.getTransactionInfo(tx.id(), SetScriptTransactionInfo.class);

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
System.out.println("script:" + txInfo.tx().script().encoded());
System.out.println("height:" + txInfo.height());
System.out.println("applicationStatus:" + txInfo.applicationStatus());
```
```js
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

