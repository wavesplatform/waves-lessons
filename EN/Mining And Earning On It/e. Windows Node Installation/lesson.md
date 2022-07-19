# Ubuntu Node Installation #
  
  - [Node Installation]()
    - [Docker Installation]()
    - [Waves Package Installation]()


## Node Installation ##

Before starting installation, make sure your Waves account has a [generating balance]() at least 1000 WAVES.<br>
It is necessary to keep on hand:
- **<ins>Seed phrase of your account Base58 encoded</ins>**:<br>
    For example,<br>
    `2DrRSwCH2WctDnC4WnG8QVoKiLXfownWKxCrsQSwQ7eZnRzN6cz2NQJ71YAmnVeWgj7GbyXfNiL45PLgPNygjuezo2jyRCZmJ5UdnDDk3CPCRjpRhNzcew6CKKthn`
- **<ins>Wallet password</ins>**:<br>
    For example, "Password_1234"

To install a node, you may use:
- <ins>[Docker](#docker-installation)</ins>:<br>
  Out-of-the-box solution easy to launch.<br>
  It is a ready container with minimum configurations you can run to have your own Waves node.
- <ins>[Waves Package](#waves-package-installation-s)</ins>:<br>
  For advanced users, it is possible to use the package.<br>
  Using the package is the way to set up a node with multiple custom configurations. 

Both ways are going to give you a fully working node.<br>
Feel free to use either of them.
  
### Docker Installation ###

Running a Waves docker container is the easiest way to install a node.<br>
Follow the steps below to install a Waves node:
1. Install [Docker](https://docs.docker.com/desktop/install/linux-install/) on Ubuntu if it wasn't yet installed.
2. Pull the latest [docker image](https://hub.docker.com/r/wavesplatform/wavesnode) of the node:
    ```
    docker pull wavesplatform/wavesnode
    ```
3. Run a docker container with such parameters as:
    - Seed of the account;
    - Password of your wallet.
    ```
     docker run -d \
     --name my-waves-node \
     -p 6869:6869 \
     -e WAVES_WALLET_SEED="insert your account seed" \
     -e WAVES_WALLET_PASSWORD="insert your account password" \
     wavesplatform/wavesnode:latest
    ```

All done! You have a working node deployed within your docker container!<br>
The next step would be [node configuration]().

### Waves Package Installation ###

