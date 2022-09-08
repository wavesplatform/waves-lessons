## Three blockchain pillars ##

There are three important pillars upon which the Waves blockchain stands:
- [Account]()  
   An account is a subject **WHICH** makes an action on the blockchain. It is not possible to make any blockchain action without an account. 
- [Asset]()  
    An asset is **WHAT** often happens to be the object of this action. Yet, certain operations do not necessarily interact with assets. For example, an account can [create an alias](), where any action with an asset is absent. Nevertheless, the central goal of a blockchain is to be an immutable ledger, where the indispensable element is an asset. 
- [Transaction]()  
    A transaction is itself an **ACTION** on the blockchain. 

The targets of this module are:
- To reveal the definitions and subtleties of [assets](), [accounts](), and [transactions]();
- To demonstrate in different programming languages how to operate with them.

The first step into this module will be [getting to know what stands behind every operation on the blockchain](#how-are-all-actions-made-on-the-blockchain). Moving forward, it will be necessary to [initialize libraries]() for further work with accounts, assets, and transactions. In the lesson [Asset creation and operation with assets](), we will talk about assets, and as an example, we will create a regular asset and an NFT. After this, in [Account creation and operations with accounts](), we will dive into the world of accounts, getting to know how an account is formed and how to create one. The next step will be the lesson [Transaction definition and work with transactions]() which will explain stages of transaction formation and list all existing transaction types. Lastly, we will run through a series of lessons to explain all the transaction types and how they can be created with code.

## How are all actions made on the blockchain? ##

Behind every action on the blockchain, for instance, creating an asset or an account, there is a function that runs a particular script. The result of a script compilation is a specific action made on the blockchain. All functions have arguments that are passed on. For example, if we are to run a [function that creates an asset](), we need to fill in necessary arguments, such as the name we want to assign to the asset, its quantity, description, and so on. Likewise, all functions have their own sets of parameters. Some functions may have matching parameters. For instance, if we are working with a [Transfer transaction]() and a [Mass transfer transaction](), in both cases, we would need to specify an `assetId` that we want to transfer. Yet, simultaneously, there will be unique parameters inherent only to a particular function. In the case of our example above, it would be `amount` that defines the sum of our transfer within [Transfer transaction]() and `totalAmount` that defines the sum of all funds we transfer to multiple users within [Mass transfer transaction](). All functions covered in this module will be written with the help of [client libraries](#client-libraries) with a list of relevant parameters and their description.

## Why and how to use client libraries for blockchain interaction? ##

The Waves team created client libraries in popular programming languages to interact with the Waves blockchain. All libraries are designed to execute the same functionality, i.e., to work with accounts, assets, and transactions. Client libraries enable the usage of out-of-the-box solutions that help to operate with the Waves blockchain. You can integrate these ready solutions into your projects. There are six libraries for the most popular languages: JavaScript, Java, PHP, C#, Go, and Python. We encourage you to utilize the most comfortable for you programming language when working with functions and operating with the blockchain.

### How to initialize a library to start operating with the Waves blockchain ###

Follow the steps below to initialize a library:
1. Primarily, it is essential to create a node instance first. Node instance creation allows you to perform all actions within a selected [network](). 

    <Message type="warning">

    In the following lessons, we will be sticking to using the Tesnet network, as it is intended for tests and does not require using real funds. However, if you wish to operate in the main network, select the Mainnet network type when creating a node instance. Please, note that for every operation in every network, there is a fee charged. Therefore, if you are using the Mainnet network, ensure you have a sufficient balance on the account. In case you wish to operate in Testnet or Stagenet, you can top up your balance for free via Faucet: [Tesnet Faucet](https://testnet.wavesexplorer.com/faucet), [Stagenet Faucet](https://stagenet.wavesexplorer.com/faucet).

    </Message>

    <CodeBlock>

    ```js
    ```
    ```java
    // Node instance creation in the given network (TESTNET, MAINNET, STAGENET)
    Node node = new Node(Profile.TESTNET);
    ```
    ```php
    ```
    ```csharp
    ```
    ```go
    /* Create a new HTTP client in the given network
    Mainnet (https://nodes.wavesnodes.com/)
    Testnet (https://nodes-testnet.wavesnodes.com/)
    Stagenet (https://nodes-stagenet.wavesnodes.com/)*/
    cl, err := client.NewClient(client.Options{
        BaseUrl: "https://nodes-testnet.wavesnodes.com/", 
        Client: &http.Client{}})
    if err != nil {
        panic(err)
    }
    ```
    ```python
    ```

    </CodeBlock>
2. As we mentioned in the [beginning of this lesson](#three-blockchain-pillars), no action on the blockchain can be done without an [account](). Therefore it is necessary to "connect" an account to functions operating with the blockchain. The next lesson, [Account creation and operations with accounts](), will describe three account core entities: private and public keys and an account address.

    <CodeBlock>

    ```js
    ```
    ```java
    // Create a private key from a seed
    PrivateKey privateKey = PrivateKey.fromSeed("seed phrase");
    // Create the public key from the private key
    PublicKey publicKey =  privateKey.publicKey();
    /* Get the account address from the public key
    Specify the same network as used with the node instance */
    Address address = Address.from(ChainId.TESTNET, publicKey);
    ```
    ```php
    ```
    ```csharp
    ```
    ```go
    // Create a private key from a BASE58 string
    sk, err := crypto.NewSecretKeyFromBase58("<your-private-key>")
    if err != nil {
        panic(err)
    }
    // Generate the public key from the private key
    pk := crypto.GeneratePublicKey(sk)

    // Current time in milliseconds
    ts := uint64(time.Now().UnixMilli())
    ```
    ```python
    ```

    </CodeBlock>