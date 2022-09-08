## Account definition ##

An account is a unique record on the platform where its management is available only to its creator. Every person can create an account on the Waves blockchain platform and manage resources. Previously, we mentioned seed phrases and private and public keys in the lesson [Getting to know web 3.0](#Digitalsignatureschapter). Now we can connect all this knowledge into one whole piece. The main goal of an account is to provide resource management available only to the account owner. Nowadays, the security and safety of your funds are critically vital. Therefore if one is to have a private account, one has to ensure the account will be secured and the funds will remain safe and untouched by malefactors. Blockchain cryptography offers a solution to account security that makes it impossible to hack it.

Let's run through the stages of account creation to understand why it is safe. Schematically, it would look like this:
![](./img/curve.png)

1. **<u>Account creation from a seed phrase</u>**   
If we were to create an account on any social media, most likely, we would be asked to use our phone number, nickname, or email and enter a password. On our platform, it is possible to create an account from a seed phrase. A seed phrase is a set of different words that will be encoded into a hash with the help of the SHA256 algorithm. Users can either type any seed phrase manually or receive a random unique seed phrase during registration. As an example, the phrase `I love Waves` will turn into a hash `0da73e9fd2df9630bcb689f5b66e76b7d1809d71ea841f7e075b8b82bd05a155`. It will be impossible to calculate it backwards that the hash `0da73e9fd2df9630bcb689f5b66e76b7d1809d71ea841f7e075b8b82bd05a155` is equal to `I love Waves`. The probability of generating two identical seed phrases is 1/2048<sup>15</sup> that even after millions of years and the heat death of the universe, a hacker would not be able to get access to the seed.
1. **<u>Private key generation from the seed</u>**  
A private key is intended for transaction signature. It is automatically generated after an account is created with the seed phrase. Every account has only one private key. The mission of a private key is to sign transactions or orders. For instance, if someone wants to send money from an A account to a B account, he must prove ownership of the A account, so the private key plays the role of such an approver. No one except the account owner can receive access to this private key. A private key can look like this: `6yCStrsBs4VgTmYcSgF37pmQhCo6t9LZk5bQqUyUNSAs`.
3. **<u>Public key generation from the private key</u>**  
A public key is intended for transaction verification. From the received private key, a unique public key is automatically generated. Every account has one unique public key. After a [transaction]() is signed by an account, it has to be verified by [multiple nodes](nodesofthewaves) as a valid one. Since network nodes do not have access to private keys, they can only check the [transaction signature](https://docs.waves.tech/en/blockchain/transaction/transaction-proof) against the public key. The result of such a verification function can be either `true`, meaning the user who initiated the transaction has a valid private key so that the transaction can be permitted, or `false`, meaning the user does not have a valid private key for this transaction initiation, and the transaction will be declined. A public key example: `5cqzmxsmFPBHm4tb7D8DMA7s5eutLXTDnnNMQKy2AYxh`.
4. **<u>Account address generation from the public key</u>**  
The final step of account generation is account address generation. An account address is generated from the public key of the account. Everyone can see the address of your account as it is public information, yet, it has no disclosure of your identity and any personal data. Account address instance: `3PDfnPknnYrg2k2HMvkNLDb3Y1tDTtEnp9X`.

This subsequential chain of steps of seed phrases transformation into private/public keys and an account address is one-sided. It will not be possible to calculate from an account address, a public or a private key what your seed phrase was. The only possible scenario is if a hacker would overtake all world's computers and concentrate on attempting to hack a particular account for the next thousands centuries. Therefore keeping a seed phrase in secret is a way to protect an account.

![](./img/keyswaves.png)

In the lessons, [What is a smart account and setting account script]() and [What is a dApp and dApp creation]() we covered definition of a smart account and a dApp. A smart account or a dApp are also considered accounts, yet with an additional configuration that regular accounts do not have.

## Operations with accounts ##

This chapter will help to distinguish operations with accounts among many possible actions on the Waves blockchain.   
All operations with assets can be groupped by two categories:
- **<u>Transactions</u>**   
    Out of [various transaction types](https://docs.waves.tech/en/blockchain/transaction-type/), there are approximately four of them that are related to interaction with accounts:
    * [Create alias transaction]()
    * [Data transaction]()  
    * [Set script transaction]()  
    * [Invoke script transaction]()  

    The lesson [Work with assets]() will be dedicated to a detailed elaboration of these transactions.
- **<u>REST API methods</u>**  
    As well, it is possible to interact with REST API methods to get some information about assets, for example:
    * **GET** `/addresses`  
        Get a list of account addresses in the [node wallet](https://docs.waves.tech/en/waves-node/how-to-work-with-node-wallet).
    * **GET** `/addresses/seq/{from}/{to}`  
        Get a list addresses in the [node wallet](https://docs.waves.tech/en/waves-node/how-to-work-with-node-wallet) by a given range of indices. The max range `{from}`-`{to}` is 100 addresses.
    * **POST** `/addresses/balance`  
        Get regular balances for multiple addresses. The max number of addresses is set by `waves.rest-api.transactions-by-address-limit`, 1000 by default. Read more about [node rest api configruations](https://docs.waves.tech/en/waves-node/node-configuration#rest-api-settings).
    * **GET** `/addresses/balance/{address}`  
        Get the regular balance in WAVES at a given address. Read more about [account balance types](https://docs.waves.tech/en/blockchain/account/account-balance).
    * **GET** `/addresses/balance/{address}/{confirmations}`  
        Get the minimum regular balance at a given address for `{confirmations}` blocks back from the current height. The max number of confirmations is set by `waves.db.max-rollback-depth`, 2000 by default. Read more about [DB Settings](https://docs.waves.tech/en/waves-node/node-configuration#db-settings) and [account balance types](https://docs.waves.tech/en/blockchain/account/account-balance).
    * **GET** `/addresses/balance/details/{address}`  
        Get [available, regular, generating, and effective account balances](https://docs.waves.tech/en/blockchain/account/account-balance#account-balance-in-waves).
    * **GET** `/addresses/data/{address}`  
        Read account data entries by given keys or a regular expression.
    * **POST** `/addresses/data/{address}`  
        Read account data entries by given keys.
    * **GET** `/addresses/data/{address}/{key}`  
        Read account data entries by a given key.
    * **GET** `/addresses/effectiveBalance/{address}`  
        Get the effective balance in WAVES at a given address. Read more about [account balance types](https://docs.waves.tech/en/blockchain/account/account-balance).
    * **GET** `/addresses/effectiveBalance/{address}/{confirmations}`  
        Get the minimum effective balance at a given address for `{confirmations}` blocks from the current height. The max number of confirmations is set by `waves.db.max-rollback-depth`, 2000 by default. Read more about [DB Settings](https://docs.waves.tech/en/waves-node/node-configuration#db-settings) and [account balance types](https://docs.waves.tech/en/blockchain/account/account-balance).
    * **GET** `/addresses/scriptInfo/{address}`  
        Get an account script or a dApp script information by a given address.
    * **GET** `/addresses/scriptInfo/{address}/meta`  
        Get an account script meta data.
    * **GET** `/addresses/validate/{address}`  
        Verify whether an account address is valid.
    * **GET** `/addresses/publicKey/{publicKey}`  
        Generate an account address from a given public key.

In this lesson, we will demonstrate an instance of the asset operations with an [Asset creation](#asset-creation) and an [NFT creation](#nft-creation). 

## Different methods of account creation ##

To get an [account](#account-definition), you will need to create:
- **[private key](#private-key-creation)**
- **[public key](#public-key-creation)**

Also, make sure to save the [address](#account-address-creation) of an account to a variable.

### Private key creation ###

You can use any of the six methods to create a private key via:

1. **Given seed phrase**:  
    It is possible to create an account via a manually written seed phrase. We used this way of an account creation in the [library initialization chapter](b36f01e4-ac85-4aa4-8a7f-9fe6a5fc26f8#how-to-initialize-a-library-to-start-operating-with-the-waves-blockchain). 

    <CodeBlock>

    ```js
    ```
    ```java
    // Create a private key from a seed
    PrivateKey privateKey = PrivateKey.fromSeed("seed phrase");
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
2. **Randomly generated seed phrase**:  
    
    You can specify the optional parameter of [`nonce`](https://ru.wikipedia.org/wiki/Nonce) step when creating an account from a randomly generated seed phrase.

    <CodeBlock>

    ```js
    ```
    ```java
    // Generate a random seed phrase
    String seed = Crypto.getRandomSeedPhrase();
    // Create the private key from the seed
    PrivateKey privateKey = PrivateKey.fromSeed(seed);
    // Create the private key from the seed and the nonce step of 2
    PrivateKey privateKey = PrivateKey.fromSeed(seed, 2);
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
3. **Given bytes set of seed phrase**

    <CodeBlock>

    ```js
    ```
    ```java
    // Create a seed phrase bytes set 
    byte[] seedBytes = {21, 55, 87, 117, -8, -81, 77, 77, -99, -87, -23, 7, 116, -99, -20, -12, -4};
    // Create the private key from the seed phrase bytes set
    PrivateKey privateKey = PrivateKey.fromSeed(seedBytes);
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
4. **Randomly generated bytes set of seed phrase**

    <CodeBlock>

    ```js
    ```
    ```java
    // Generate a random seed phrase bytes set 
    byte[] randomSeedBytes = Crypto.getRandomSeedBytes();
    // Create the private key from the random seed phrase bytes set
    PrivateKey privateKey = PrivateKey.fromSeed(randomSeedBytes);
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
5. **Given bytes set** 

    <CodeBlock>

    ```js
    ```
    ```java
    // Create a bytes set
    byte[] bytes = {56, -3, 37, 64, 2, 38, 78, 37, -98, -45, -23, 117, 14, 88, 20, 42, -9,
                21, 55, 87, 117, -8, -81, 77, 77, -99, -87, -23, 7, 116, -99, -20};
    // Create the private key from seed bytes
    PrivateKey privateKey = PrivateKey.as(bytes);
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
6. **Base58 encoded string**

    <CodeBlock>

    ```js
    ```
    ```java
    // Create a Base58 encoded string
    String base58PhraseEncoded = "8hVeUrGJqb2yvecqmssSc7MP9SwKLQYycW7H1Zz3omwA";
    // Create the private key from the Base58 encoded string
    PrivateKey privateKey = PrivateKey.as(base58PhraseEncoded);
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





### Public key creation ###

Invoke the publicKey method from the [private key](#private-key-creation) to create a public key:

<CodeBlock>

```js
```
```java
// Create the public key from the private key
PublicKey publicKey =  privateKey.publicKey();
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

### Account address creation ###

Receive the address from the [public key](#public-key-creation):

<CodeBlock>

```js
```
```java
// Get the account address from the public key
// Specify the network (TESTNET, MAINNET, STAGENET)
Address address = Address.from(ChainId.TESTNET, publicKey);
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