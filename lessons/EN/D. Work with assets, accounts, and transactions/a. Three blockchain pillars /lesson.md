
## Three blockchain pillars ##

Within the Waves blockchain, there are three important pillars upon which the blockchain stands:
- [Account]()  
   An account is a subject **WHO** makes an action on the blockchain. It is not possible to make any blockchain action without an account. 
- [Asset]()  
    An asset is **WHAT** often happens to be the object of this action. Yet, there are certain operations that do not necessarily interact with assets. For example, an account can [create an alias](), where any action with an asset is absent. Nevertheless, the major goal of a blockchain is to be an immutable ledger, where the indispensable element is an asset. 
- [Transaction]()  
    A transaction is itself an **ACTION** on the blockchain. 

The targets of this module are:
- To reveal definitions and subtleties of [assets](), [accounts](), and [transactions]();
- To demonstrate relevant code examples operating with them written in different programming languages.

In the lesson [Asset creation and operation with assets](), we will talk about assets, and as an example, we will create a regular asset and an NFT. After this, in [Account creation and operations with accounts](), we will dive into the world of accounts, getting to know how an account is formed and how to create one. The next step will be the lesson [Transaction definition and work with transactions]() which will explain stages of transaction formation and list all existing transaction types. Lastly, we will run through a series of lessons dedicated to a detailed explanation of all the transaction types and how they can be created with code.

### Functions parameters ###

Behind every action on the blockchain, for instance, creating an asset/account or sending a transaction to a node, there is a function that runs a particular script. The result of a script compilation is a particular action made on the blockchain. All functions have arguments that are passed on. For example, if we are to run a [function that creates an asset](), we need to fill in necessary arguments, such as the name we want to assign to the asset, its quantity, description, and so on. Likewise, all functions have their own sets of parameters. Some functions may have matching parameters. For instance, if we are working with a [Transfer transaction]() and a [Mass transfer transaction](), in both cases, we would need to specify an `assetId` that we want to transfer. Yet, simultaneously, there will be unique parameters inherent only to a particular function. In the case with our example above, it would be `amount` that defines the sum of our transfer within [Transfer transaction]() and `totalAmount` that defines the sum of all funds we transfer to multiple users within [Mass transfer transaction](). All functions covered in this module will be given a list of relevant parameters with their explanation.