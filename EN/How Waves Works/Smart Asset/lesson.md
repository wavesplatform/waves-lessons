# Smart Asset #

This lesson will answer the question "What is a smart asset?".

Duration: <span></span> min

 - [Smart Asset Description](#smart-asset-description)
 - [Usage Examples](#usage-example)
   - [Token Usage Freeze](#token-usage-freeze)
   - [Unburnable Token](#unburnable-token)
 - [Setting An Account Script](#setting-an-account-script)
   - [Requirements](#requirements)
   - [Limitations](#limitations)
   - [Writting A Smart-Asset Script](#writting-a-smart-asset-script)

--- 

## Smart Asset Description ##

On the Waves platform, it is possible to issue your own token.<br>
You can give it a name, promote it, making the token a valuable currency.<br>
Issuing a token is [one of the transaction types](#referencetotokenizationblockchainchapter) made on the blockchain.<br>
All the tokens can be either regular assets or smart assets.<br>

A smart asset is an asset to which a script is attached to.<br>
It is one of 3 types of [smart contracts](https://docs.waves.tech/en/building-apps/smart-contracts/waves-smart-contracts-overview) along with [dApp]() and [smart account]().<br>
The result of usage of an asset script is either allowing a transaction with that asset or rejecting it.<br>

For example, we may create a smart asset with a script that blocks operations with this asset for certain users.<br>

There are 3 different possible results of the asset script invokation:

- **<ins>Permitted transaction</ins>**:<br>
  The transaction is permitted, all the of the conditions of the script are satisfied.<br>
  This transaction will be included in the blockchain and the [fee](https://docs.waves.tech/en/building-apps/smart-contracts/what-is-smart-asset#smart-asset-fees) for asset script invokation charged.
- **<ins>Declined transaction</ins>**:<br>
  The asset script invokation found the incompatibility with the conditions, leading to rejection of the transaction.<br>
  In such a case, the fee for asset script invokation will be charged and the transaction will be marked as rejected in the blockchain.
- **<ins>Error of compilation</ins>**:<br>
  An error of the script compliation has occured, the transaction was declined.<br>
  No fee will be charged and the transaction will not appear in the blockchain.<br>

Read more about [Smart Asset](https://docs.waves.tech/en/building-apps/smart-contracts/what-is-smart-asset#asset-script).

---

## Usage Examples ##

All of the possible usage scenarios depend on the ingenuity of the asset creator.<br>
We will demonstrate a very few basic examples for the sake of simplicity.<br>
These examples will be writen in the [Ride programming language](https://docs.waves.tech/en/ride/).<br>
In the topic [Programming on RIDE]() basics of the language will be described.<br>

### `Token Usage Freeze` ###

Once there is a certain height of the blockchain (1610000 blocks), disable all operations with the smart asset. 

```
{-# STDLIB_VERSION 6 #-}
{-# CONTENT_TYPE EXPRESSION #-}
{-# SCRIPT_TYPE ASSET #-}

let targetHeight = 1610000
height >= targetHeight
```

### `Unburnable Token` ###

Make the asset unburnable, i.e. impossible to have the token amount reduced or the token to be destroyed.<br>

```
{-# STDLIB_VERSION 6 #-}
{-# CONTENT_TYPE EXPRESSION #-}
{-# SCRIPT_TYPE ASSET #-}

match tx {
  case t : BurnTransaction => false
   case _ => true
}
```

More about [Burn Transaction](https://docs.waves.tech/en/blockchain/transaction-type/burn-transaction).<br>

---

## Setting An Asset Script ##

The Waves offers a great comfortable tool for operating with smart contracts, called [Waves IDE](https://waves-ide.com/).<br>
From now on, we will use the Waves IDE when demonstrating the work with smart contracts.<br>

### Requirements ###
To create a smart-asset, it is necessary:

- Send an [Issue Transaction](https://docs.waves.tech/en/blockchain/transaction-type/issue-transaction) of version 2 or higher;
- Include a script in base64 encoding in the issue transaction.

Please, note the minimum fee for this transaction is 1 WAVES.<br>

### Limitations ###
There are 2 major limitations when working with smart-asset creation is

- **<ins>Inability to change asset type:</ins>**<br>
  Creation of a smart asset is possible at the moment of a token creation.<br>
  If you create a token with no script attached to it, it will not be possible to attach a script to it later.<br>
  Similarly, if a token is created as a smart-asset, it will always stay a smart asset with a possiblity to change the script at any time.<br>
  In case you don't have any ready scripts, you can write a simple script that always returns `true` and change it later.<br> 
- **<ins>A smart asset cannot be sponsored:</ins>**<br>
  Read more about [Fee in Sponsored Asset](https://docs.waves.tech/en/blockchain/transaction/transaction-fee#fee-in-sponsored-asset).


### Writting A Smart-Asset Script ###

<!-- #### `Set asset script transaction` #### -->

Трансформируем написанный скрипт в кодировку base64.<br>
Запустим транзакцию создания [тестового токена](#issue-transaction).<br>
Установим скрипт в кодировке base64 на токен с помощью транзакции установки скритпа.


```Java
// Необходимые импортирования
import com.wavesplatform.transactions.common.AssetId;
import com.wavesplatform.transactions.common.Base64String;
import com.wavesplatform.transactions.IssueTransaction;
import com.wavesplatform.transactions.SetAssetScriptTransaction;
import com.wavesplatform.wavesj.info.IssueTransactionInfo;
import com.wavesplatform.wavesj.info.TransactionInfo;
import com.wavesplatform.wavesj.info.SetAssetScriptTransactionInfo;

// Реализация через builder
Base64String script = node.compileScript("{-# SCRIPT_TYPE ASSET #-} true")
        .script();
AssetId assetId = node.waitForTransaction(
        node.broadcast(IssueTransaction.builder("Asset", 1000, 2)
        .script(script)
        .getSignedWith(alice)).id(), IssueTransactionInfo.class)
        .tx().assetId();
SetAssetScriptTransaction tx = SetAssetScriptTransaction.builder(assetId, script).getSignedWith(alice);

// Отправка транзакции на ноду и вывод на экране информации о ней
node.waitForTransaction(node.broadcast(tx).id());
TransactionInfo commonInfo = node.getTransactionInfo(tx.id());
SetAssetScriptTransactionInfo txInfo = node.getTransactionInfo(tx.id(), SetAssetScriptTransactionInfo.class);

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
System.out.println("script:" + txInfo.tx().script().encoded());
System.out.println("height:" + txInfo.height());
System.out.println("applicationStatus:" + txInfo.applicationStatus());

```


**Описание аргументов**
| Наименование поля | Описание | Пример |
| ----------- | ----------- | ----------- |
| assetId | Token ID in base58. | 7qJUQFxniMQx45wk12UdZwknEW9cDgvfoHuAvwDNVjYv |
| script | Cкомпилированный скрипт ассета, до 8192 байт, в кодировке base64. | base64:AQa3b8tH |
