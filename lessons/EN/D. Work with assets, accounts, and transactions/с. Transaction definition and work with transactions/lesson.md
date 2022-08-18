- [Transaction definition](#transaction-definition)
- [Stages of a transaction formation](#stages-of-a-transaction-formation)
- [Transaction fees](#transaction-fees)
- [Transaction types](#transaction-types)

## Transaction definition ##

A transaction is an action made on the blockchain on behalf of an [account](). Every transaction is associated with an account and is inseparable from it. In this lesson’s chapter [Transaction types](#transaction-types), you will become familiar with all possible transaction types within the Waves blockchain. A regular transaction demonstration can be a cryptocurrency transfer from one account to another. Here we have both an account and an action made on behalf of that account - a transfer from one wallet to another.

Every transaction goes through different formation stages, from its initiation to the final appearance on the blockchain, which will be elaborated in the chapter [Stages of a transaction formation](#stages-of-a-transaction-formation). All transactions are charged with a [fee](#transaction-fees).

## Stages of a transaction formation ##

Before a transaction gets into the blockchain, it has to pass all necessary stages of transaction formation. At the illustration below you may see five major steps that every transaction goes through:

![](./img/txstages.png)

There are five important steps:
1. **<u>Transaction initilization</u>**  
    During this step, an account initiates a transaction, specifying all necessary parameters. Once all parameters are specified, the transaction has to be signed with a [private key]() of that account. The signature represents proof that the account owner initiated the transaction. For example, we can refer to an [Issue transaction]() that issues a new asset, where a user needs to specify the name of the asset, its quantity, reissuability, etc. Afterward, the transaction gets signed by the account owner.
2. **<u>Transaction broadcasting</u>**  
    A signed transaction has to be broadcasted to a node, which means sending to a node an information about the signed transaction. For example, it can be done via the [REST API](http://127.0.0.1:6869/api-docs/index.html#/transactions/broadcastSignedTx) service of your node with a [JSON transaction representation](https://docs.waves.tech/en/blockchain/transaction/#json-representation). Also, if a user is more interface-oriented, another example can be given: once an account in [Waves Exchange](https://waves.exchange/) goes to the [WAVES withdrawal page](https://waves.exchange/withdraw/WAVES) and transfers WAVES to another wallet, the transaction will be broadcasted to a node.
3. **<u>UTX pool</u>**  
    A node that received a broadcasted transaction will send this transaction to the UTX pool (Unconfirmed Transaction Pool). This is a place, where all transactions are temporarily stored and checked whether they are valid before it is decided if this transaction can be included in the blockchain. A real life comparison can be a conveyer that operates with car parts and separates all working parts from defective ones. 
4. **<u>Transaction Validation</u>**  
    Multiple nodes in the network are working with the UTX pool and verifying transactions. The verification process includes such elements as checking if an account truly initiated the transaction and signed it with a valid private key, if the account had a sufficient available balance, and so on. Different [transaction types](#transaction-types) have different parameters to be verified. 
5. **<u>Saving into the blockchain</u>**  
    In the module [Mining and earning on it](), we installed a node that is ready for mining. In this final step, a node that will generate the next block will include a transaction in the blockchain if it was verified by nodes within the verification step out of the UTX pool.
     
## Transaction fees ##


## Transaction types ##

There are five transactions types within the Waves blockchain:
- **<u>Work with assets</u>**
    - Issue
    - Reissue
    - Update asset info
    - Burn
    - Set asset script
    - Set sponsorship
- **<u>Work with accounts</u>**
  - Alias
  - Data
  - Set script
  - Invoke script
- **<u>Performing transfers</u>**
  - Transfer
  - Mass transfer
  - Exchange
- **<u>Leasing</u>**
  - Lease
  - Lease cancel
- **<u>Ethereum transaction</u>**



1. TX definition
2. Stages of transaction formation
- an account signs (either my node offers tx or an official Waves node automatically works if a service used)
- broadcasts
- all nodes verify it 
(validation - refer to https://docs.waves.tech/en/blockchain/transaction/transaction-validation)
- if ok - appears on the bc 
(limitations of a block to contain 1 MB)
3. It is stored in binary format (bytes) in the blockchain
4. Tx can be viewed in Waves Exp or rest api swagger?
- If swagger used, it will look like JSON
- If Waves Exp - human readable format
- If libs?
1. Metnion fees
By default, Waves receives all comissions, yet if someone decides to create their own sponsored asset, he can receive a comission as well (platform will retain its share still)
6. Transaction types with reference to its chapter.
Mostly division of transaction and their relevant description