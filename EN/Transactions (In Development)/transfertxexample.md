- `Transfer Transaction`:
<br>Transfers a certain amount of [token](https://docs.waves.tech/en/blockchain/token/) to another account.
<br>More о about [Transfer Transaction](https://docs.waves.tech/ru/blockchain/transaction-type/transfer-transaction).
<br>

  ```Java
  // Necessary imports
  import com.wavesplatform.transactions.TransferTransaction;
  import com.wavesplatform.transactions.common.Amount;

  // Setting up the address of the recipient (bob) and data transaction (id and the amount of the transferable asset)
  TransferTransaction tx = TransferTransaction
          .builder(bob.address(), Amount.of(1000, new AssetId("7uncmN7dZfV3fYVvNdYTngrrbamPYMgwpDnYG1bGy6nA")))
          .getSignedWith(alice); // Signing the transaction with a private key of the alice user.

  // Sending the transaction to the blockchain node
  node.waitForTransaction(node.broadcast(tx).id());
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

  <br>

  **Parameters Description**
  | Field | Description | Example |
  | ----------- | ----------- | ----------- |
  | assetId | Token ID base58 encoded.<br>null means transfer in WAVES. | 7uncmN7dZfV3fYVvNdYTngrrbamPYMgwpDnYG1bGy6nA |
  | amount | Amount of token to transfer:<br> an integer value specified in the minimum fraction (“cents”) of token.| 1000 |
  | recipient | Recipient address base58 encoded or recipient [alias](https://docs.waves.tech/en/blockchain/account/alias) with alias:<chain_id>:prefix.<br>For example alias:T:merry (see [Chain ID](https://docs.waves.tech/en/blockchain/blockchain-network/#chain-id)) | 3PFmoN5YLoPNsL4cmNGkRxbUKrUVntwyAhf |
  | attachment | 	Arbitrary binary data (typically a comment to transfer) base58 encoded, up to 140 bytes. | 3vrgtyozxuY88J9RqMBBAci2UzAq9DBMFTpMWLPzMygGeSWnD7k | 
  <!-- | sender | Адрес отправителя в кодировке base58 | 3P274YB5qseSE9DTTL3bpSjosZrYBPDpJ8k |
  | proofs | | | -->

- `Exchange Transaction`:<br>
  Exchanges two different tokens between two accounts.<br>
  More about [Exchange Transaction](https://docs.waves.tech/en/blockchain/transaction-type/exchange-transaction).<br>
    
  ```Java
  // Necessary imports
  import java.util.Arrays;
  import com.wavesplatform.transactions.ExchangeTransaction;
  import com.wavesplatform.transactions.IssueTransaction;
  import com.wavesplatform.transactions.common.Amount;
  import com.wavesplatform.transactions.common.AssetId;
  import com.wavesplatform.transactions.common.Base64String;
  import com.wavesplatform.transactions.exchange.Order;
  import com.wavesplatform.transactions.exchange.OrderType;

  // Creation of a test token with the name "Asset" in the quantity of 1000 and 0 decimals
  AssetId assetId = node.waitForTransaction(node.broadcast(
          IssueTransaction.builder("Asset", 1000, 0)
          .getSignedWith(alice)).id(),
          IssueTransactionInfo.class).tx().assetId();

  // Setting the desired amount of asset and its price
  Amount amount = Amount.of(1);
  Amount price = Amount.of(100, assetId);

  // Setting the commission of the matcher
  long buyMatcherFee = 300000;
  long sellMatcherFee = 300000;

  // Creation of buy order
  Order buy = Order.builder(OrderType.BUY, amount, price, alice.publicKey())
          .getSignedWith(bob);
  // Creation of sell order
  Order sell = Order.builder(OrderType.SELL, amount, price, alice.publicKey())
          .getSignedWith(alice);

  // Complete the exchange transaction
  ExchangeTransaction tx = ExchangeTransaction
          .builder(buy, sell, amount.value(), price.value(), buyMatcherFee, sellMatcherFee)
          .getSignedWith(alice);

  // Sending the transaction to the blockchain node
  node.waitForTransaction(node.broadcast(tx).id());
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
  | amount | Amount of the amount asset:<br> an integer value specified in the minimum fraction (“cent”) of asset | 1000 |
  | price | Price for the amount asset nominated in the price asset, multiplied by the factor:<br>- 10<sup>8</sup> for the Exchange transaction version 3;<br>- 10<sup>8 + priceAssetDecimals – amountAssetDecimals,<br>where amountAssetDecimals, priceAssetDecimals are decimals of the assets, for the Exchange transaction version 2 or 1.</sup>| 1134500 |
  | buyMatcherFee | Matcher fee for the buy order execution. The fee token ID is indicated in buy order. | 300000 |
  | sellMatcherFee | Matcher fee for the sell order execution. The fee token ID is indicated in sell order. | 750 | 
  | order1, order2 | Buy and sell orders. See the  [Order](https://docs.waves.tech/en/blockchain/order). | [Example](https://docs.waves.tech/en/blockchain/transaction-type/exchange-transaction#json-representation:~:text=%22order1%22%3A,%5D%0A%20%20%7D%2C)|
