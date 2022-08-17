- [Transaction definition](#transaction-definition)
- [Stages of a transaction formation](#stages-of-a-transaction-formation)
- [Transaction fees](#transaction-fees)
- [Transaction types](#transaction-types)

## Transaction definition ##

A transaction is an action made on the blockchain on behalf of an [account](). Every transaction is associated with an account and is inseparable from it. In this lesson’s chapter [Transaction types](#transaction-types), you will become familiar with all possible actions within the Waves blockchain. A regular transaction demonstration can be a cryptocurrency transfer from one account to another. Here we have both an account and an action made on behalf of that account - a transfer from one wallet to another.

Every transaction goes through different stages, from its initiation to the final appearance on the blockchain, which will be elaborated in the chapter [Stages of a transaction formation](#stages-of-a-transaction-formation). All transactions are charged with a [fee](#transaction-fees).

## Stages of a transaction formation ##

Before a transaction gets into the blockchain, it has to pass all necessary stages

![](./img/txstages.png)

## Transaction fees ##

## Transaction types ##

There are multiple different operations that we can perform with with an account:



1. Stages of transaction formation
- an account signs (either my node offers tx or an official Waves node automatically works if a service used)
- broadcasts
- all nodes verify it (validation - refer to https://docs.waves.tech/en/blockchain/transaction/transaction-validation)
- if ok - appears on the bc (limitations of a block to contain 1 MB)
(is it an account who initiates a tx or a node?)
(difference between a smart/dApp account or a regular account)
(is it all nodes verifying or 8 confirmations is enough?    )
(In which cases errors may occur so tx would fail or marked as declined)
2. It is stored in binary format (bytes) in the blockchain
3. Tx can be viewed in Waves Exp or rest api swagger?
(How about libraries?)
- If swagger used, it will look like JSON
- If Waves Exp - human readable format
- If libs?
4. Metnion fees
By default, Waves receives all comissions, yet if someone decides to create their own sponsored asset, he can receive a comission as well (platform will retain its share still)
5. Transaction types with reference to its chapter.
Mostly division of transaction and their relevant description