# Ubuntu Node Installation #

  - [Node Structure](#node-structures)
  - [Prerequisites](#prerequisites)
  - [Node Installation](#node-installation)
    - [Docker Installation](#docker-installation)
    - [Waves Package Installation](#waves-package-installations)

---

## Node Structure ##

To make all of our steps of node installation clear, it is better, to begin with, a node structure explanation.<br>
Understanding the structure of the node will shed some light on major essences that the node interacts with.<br>

Under the bonnet, every node has:
- **<ins>Blockchain database</ins>**:<br>
    All the nodes of the Waves blockchain are intended to ensure [decentralization]().<br>
    Therefore, an indentical copy of all the blockchain data needs to be stored in every single node.<br>
- **<ins>Configuration file</ins>**:<br>
    A configuration file is a set of instructions of how a node should be working.<br>
    In the configuration file, we can define multiple parameters, for instance, which [network]() to connect to.

![](./images/nodestr.png)

---

## Prerequisites ##

Before starting installation, make sure your Waves account has a [generating balance]() at least 1000 WAVES.<br>
Also, it would be necessary to keep on hand a Base58 encoded string of the seed phrase of your account.<br>
Here is how you can encode a seed phrase to Base58:<br>
1. Open the [Waves IDE](https://waves-ide.com/);
2. Click "RideREPL" down the screen:<br>
    ![](./images/repl1.png)<br>
3. Insert in the function your seed phrase:
    `"your-seed-phrase".toBytes().toBase58String()`<br>
    For example, `"surround fever above evil walk slam left thought credit pinch life follow arch work stock".toBytes().toBase58String()`
4. Copy the function with your seed phrase to the console:<br>
    ![](./images/repl2.png)<br>
5. Click "Enter" to get a Base58 encoded string of your seed phrase:
    ![](./images/repl3.png)
6. Save this Base58 encoded string, as we will use it later for node installation.<br>

---

## Node Installation ##

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
3. Create folders where you would like to store the blockchain copy and a configuration file.<br>

    ```
    sudo mkdir -p /opt/waves-node/{data,conf}
    ```
    This command will create 2 folders (data, conf) within `/opt/waves-node` directory.
4. Run a docker container.<br>
   Within this docker container, it is necessary to:
    - Create [docker volumes](https://docs.docker.com/storage/volumes/) to "connect" the data we store locally on our host with the storage of the container.<br>
      Do it for both directories that store the blockchain data (`opt/waves-node/data`) and the configuration file (`/opt/waves-node/conf`).<br>
      It will "link" the data from your host to the container's storage to `/var/lib/waves` for the blockchain data and `/etc/waves` for the configuration file.<br>
      In case you would stop or restart the container, the blockchain copy and the configuration file will be cached locally on your computer, so no data will be lost after re-start.<br>
      <!-- The reason why we are doing it is that we risk to lose all the data if everything is stored within the container's storage only.<br> -->
    - [Map](https://docs.docker.com/config/containers/container-networking/) the container port to the localhost port.
    - Insert the [Base58 encoded string of the wallet seed](#prerequisites).
    - Type a password that would be stored locally on your host to protect your encoded seed.

    ```
     docker run -d \
     -v /opt/waves-node/data:/var/lib/waves \
     -v /opt/waves-node/conf:/etc/waves \
     --name my-waves-node \
     -p 6869:6869 \
     -e WAVES_WALLET_SEED="insert your account seed Base58 encoded that you saved earlier" \
     -e WAVES_WALLET_PASSWORD="type a password" \
     wavesplatform/wavesnode:latest
    ```

5. To make sure everything is working properly, we can check logs.<br>
    Copy the ID of the running docker container after running the command:
    
    ```
    docker ps
    ```
    It may look something like this: <br>
    ```
    CONTAINER ID 
    c3f7dacea0d4
    ```

    Write the command to see the logs of the running container with the container ID:

    ```
    docker logs c3f7dacea0d4
    ```

    You will see multiple lines of logs.<br>
    Please, note it may take a few moments to deploy a node.<br>
    Once you see notifications about the height of the blockchain, it means everything is working properly:

    ```
    INFO [appender-25] c.w.s.BlockchainUpdaterImpl - New height: 100
    ```
    

All done! You have a working node deployed within your docker container!<br>
The next step would be [node configuration]().

### Waves Package Installation ###

Waves node installation via package is a more advanced way of node deployment.<br>
Follow the steps below to install a Waves node:
1. Install Java (OpenJDK 8).<br>
    Please, note, if you already have OpenJDK 11 installed, there is no need to roll it back to OpenJDK 8.<br>
    The node Installation is supported in both the 8th and the 11th versions.<br>
    ```
    sudo apt-get update
    sudo apt-get install openjdk-8-jre
    ```

    Now check the JDK version with the following command:<br>
    
    ```
    java -version
    ```

    If you see in the output the version is such as below or higher, you can move to the next step.<br>

    ```
    java version "1.8.0_201"
    Java(TM) SE Runtime Environment (build 1.8.0_201-b09)
    Java HotSpot(TM) 64-Bit Server VM (build 25.201-b09, mixed mode)
    ```

2. Download the [latest version](https://github.com/wavesplatform/Waves/releases) of `waves-all-<version number>.jar` to any folder.<br> 
    For instance, `/opt/waves`.
3. Download the [sample](https://github.com/wavesplatform/Waves/blob/master/node/waves-sample.conf) configuration file in the same directory.<br>
4. Launch the terminal, move to the folder, and open the configuration file in the editor:<br>
   ```
   cd /opt/waves
   sudo nano waves-sample.conf
   ```
5. Study the minimum parameters.<br>
    It will be necessary to edit the configuration file to run a node.<br>
    The file contains multiple parameters related to the wallet, blockchain, rest-api, etc.<br>
    Within this lesson, we don't have a goal to configure them all, as we have the lesson [Node Configurations]() dedicated to it.<br>
    As of now, it would be enough to run a node with minimum parameters.<br>

    | Parameter | Description | Example |
    | :---- | :---- | :---- |
    | password | The password you are setting up locally on your host.<br> This password will be stored locally within the `wallet.dat` file.<br>Please, save this password to not to lose the access to the account. | `password = "RandomPassword_"` |
    | seed | The seed phrase of your Waves account encoded to Base58 string. <br> |  `seed = "K6XzUChB6DwTYCM1WxtVrv1BM6jTdcaBJrn6vkB3cK7qXCnqLV"` |
6. Edit and save the configuration file.<br>
    We may remove all the parameters except the password and the seed of the wallet.<br>
    Set a password and insert a seed Base58 encoded string.<br>
    It may look something as in the code below:<br>

    ```
    waves {

    wallet {
            # Password to protect wallet file
            password = "RandomPassword_"

            # Wallet seed as BASE58 string
            seed = "K6XzUChB6DwTYCM1WxtVrv1BM6jTdcaBJrn6vkB3cK7qXCnqLV"
        }
    }
    ```
7. Run the script in the current directory to deploy a node (`/opt/waves` in our example).<br>
    Replace {*} with the actual file name.
    ```
    cd /opt/waves
    java -jar {*}.jar {*}.conf
    ```
    For example:
    ```
    cd /opt/waves
    java -jar waves-all-1.4.7.jar waves-sample.conf
    ```
8. Please, note it may take a few moments to deploy a node.<br>
    Once you see logs about the height of the blockchain, it means everything is working properly:

    ```
    INFO [appender-22] c.w.s.BlockchainUpdaterImpl - New height: 5100
    ```
    
Congratulations!<br>
You would have a working node deployed!
<br><br>
Read the next lesson, [Node Configuration](), to learn how to set node configurations.