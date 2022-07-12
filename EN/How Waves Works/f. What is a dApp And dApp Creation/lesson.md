# What is a dApp And dApp Creation #

- [DApp Definition]()
- [Usage Examples]()
- [Setting A DApp Script]()
  - [DApp Structure](#dapp-structure)
  - [Limitations](#limitations)
  - [Setting A DApp Script](#seting-a-dapp-script)

---

## DApp Definition ##

A dApp is a Waves account with an attached script.<br>
In the previous chapter, [What is A Smart Account And Setting Account Script](), we discussed the differences between a regular and a [smart account](#smartaccountdefinition).<br>
It will not be superfluous to remind that a dApp works with incoming transactions, while a smart account operates with outgoing transactions.<br>

For us, as for users, it may be clear what it means to operate with outgoing transactions.<br>
We just have a control over our own account, where we set a script that automates some actions.<br>
It is a way of account management that makes the life of the owner easier.<br>
<br>
Yet, it may be a bit ambigious of what an incoming transaction is.<br>
Let's give it a try to grasp the idea with the following diagram example:<br><br>
![](./images/dapp_diagram.png)
<br><br>
The blue block user is our dApp account.<br>
We are the creators of a token, called "SAMPLE" that became popular in the imaginary world.<br>
Due to the token anniversary, we decided to make a giveaway of 10 tokens to 10 unique users.<br>
To get one free token, any user should "contact" a dApp via [Invoke Script Transaction](https://docs.waves.tech/en/blockchain/transaction-type/invoke-script-transaction)<br>(will be explained in detail in the [Operations with transactions]() chapter).<br>
<br>
The green block user is a random user that decided to participate in the giveaway and receive 1 SAMPLE for free.<br>
This user "contacts" our dApp account via the invoke script transaction, which launches a script in the dApp.<br>
The script makes all necessary actions, calculations, and finds out it is a unique user that was the first one to receive the reward.<br>
Since all the script conditions were true (a unique user within the first 10 reward claimers), the dApp credited 1 SAMPLE to that account.<br>
<br>
Let's recap the dApp definition, a dApp is a Waves account with an attached script that allows to invoke the script externally.<br>
Read more about [dApp](https://docs.waves.tech/en/building-apps/smart-contracts/what-is-a-dapp).


---

## Usage Examples ##

Results of dApp usage can be completely diverse, depending on the creativity of a developer.<br>
However, there are certain limits of what those dApp callable functions are capable of:

- Editing [data storage](https://docs.waves.tech/en/blockchain/account/account-data-storage) entries;
- Working with [tokens](#tokenreference);<br>(Transfering, Issuing, Reissuing, Burning);
- Reading [blockchain data](https://docs.waves.tech/en/building-apps/smart-contracts/what-is-a-dapp#data-accessible-by-dapp);
- Setting [sponsorship](https://docs.waves.tech/en/ride/structures/script-actions/sponsor-fee).


---

## Setting A DApp Script ##


### DApp Structure ###

The structure of a dApp may seem a bit more complex than smart account's, so we will dedicate a chapter to it.<br>
Below you can see a basic structure of dApp.<br>
<br>
![](./images/dapp_structure.png)
<br><br>

There are 2 necessary elements:

- **<ins>Directives</ins>**:<br>
    It is a set basic configurations written in the [Ride programming language](#ridechappter).<br>
    They "inform" a compiler that we:
    
    - Use the Standard library of the 6th version;
    - Type of the script is dApp;
    - The script will be assigned to an account (not an aseet).
    
    ```
    {-# STDLIB_VERSION 6 #-}
    {-# CONTENT_TYPE DAPP #-}
    {-# SCRIPT_TYPE ACCOUNT #-}
    ``` 
- **<ins>Callable function</ins>**:<br>
    A callable function that is invoked externally.<br>
    This is the very script that another user would invoke.<br>
    It is necessary that a dApp would have at least one callable function.<br>
    Also, you may write multiple callable functions within one dApp.<br>

    The callable function should be marked with the `@Callable(i)` annotation.<br>
    The `i` is an [Invocation](https://docs.waves.tech/en/ride/structures/common-structures/invocation) structure that contains invoke script transaction fields available to the callable function.

    Below you can see an example of a callable function.<br>
    It transfers 1 WAVES to an account that invoked it.<br>
    Afterward, it records the request information in the [account data storage](https://docs.waves.tech/en/blockchain/account/account-data-storage).<br>
    As well, it contains one condition: if the same account tries to invoke once again, the callable function does nothing.<br>

    <br>

    ```
    @Callable(i)
    func faucet () = {
        let isKnownCaller =  match getBoolean(this, toBase58String(i.caller.bytes)) {
            case hist: Boolean =>
                hist
            case _ =>
                false
        }
        if (!isKnownCaller) then 
            (
            [
                BooleanEntry(toBase58String(i.caller.bytes), true),
                ScriptTransfer(i.caller, 100000000, unit)
            ],
            unit
            )
        else ([],unit)
    }
    ```

There are 2 optional elements:

- **<ins>Verifier function</ins>**:<br>
- **<ins>Script context</ins>**:<br>

### Limitations ###

### Seting A DApp Script ###