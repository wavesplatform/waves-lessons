# Ubuntu Node Installation #

  - [Node Structure](#node-structures)
  - [Prerequisites](#prerequisites)
  - [Node Installation](#node-installation)
    - [Docker Installation](#docker-installation)
    - [Deb Package Installation](#deb-package-installation)
    - [Waves Package Installation](#waves-package-installations)

---

## Node Structure ##

To make all of our steps of node installation clear, it is better, to begin with, a node structure explanation.  
Understanding the structure of the node will shed some light on major essences that a node interacts with.  

Under the bonnet, every node has:
- **<ins>Blockchain database</ins>**:  
    All the nodes of the Waves blockchain are intended to ensure [decentralization]().  
    Therefore, an indentical copy of all the blockchain data needs to be stored in every single node.  
- **<ins>Configuration file</ins>**:  
    A configuration file is a set of instructions of how a node should be working.  
    In the configuration file, we can define multiple parameters, for instance, which [network]() to connect to.

![](./images/nodestr.png)

---

## Prerequisites ##

Before starting installation, make sure your Waves account has a [generating balance]() at least 1000 WAVES.  
Also, it would be necessary to keep on hand a Base58 encoded string of the seed phrase of your account.  
Here is how you can encode a seed phrase to Base58:  
1. Open the [Waves IDE](https://waves-ide.com/);
2. Click "RideREPL" down the screen:  
    ![](./images/repl1.png)  
3. Insert in the function your seed phrase:
    `"your-seed-phrase".toBytes().toBase58String()`  
    For example, `"surround fever above evil walk slam left thought credit pinch life follow arch work stock".toBytes().toBase58String()`
4. Copy the function with your seed phrase to the console:  
    ![](./images/repl2.png)  
5. Click "Enter" to get a Base58 encoded string of your seed phrase:
    ![](./images/repl3.png)
6. Save this Base58 encoded string, as we will use it later for node installation.  

---

## Node Installation ##

To install a node, you may use:
- <ins>[Docker](#docker-installation)</ins>:  
  Out-of-the-box solution easy to launch.  
  It is a ready container with minimum configurations you can run to have your own Waves node.
- <ins>[Deb Package](#deb-package-installation)</ins>:  
  The deb package for Ubuntu/Debian users easy to install and use.
- <ins>[Waves Package](#waves-package-installation-s)</ins>:  
  For advanced users, it is possible to use the package.  
  Using the package is the way to set up a node with multiple configurations. 

Both ways are going to give you a fully working node.  
Feel free to use either of them.
  
### Docker Installation ###

Running a Waves docker container is the easiest way to install a node.  
Follow the steps below to install a Waves node:
1. Install [Docker](https://docs.docker.com/desktop/install/linux-install/) on Ubuntu if it wasn't yet installed.
2. Pull the latest [docker image](https://hub.docker.com/r/wavesplatform/wavesnode) of the node:
    ```
    docker pull wavesplatform/wavesnode
    ```
3. Create folders to store the blockchain copy and a configuration file:

    ```
    sudo mkdir -p /opt/waves-node/{data,conf}
    sudo chown -R $(whoami) /opt/waves-node/
    ```
    This command will create 2 folders (data, conf) within `/opt/waves-node` directory.  
    After this, we give access to the current user logged in the system to writing and reading in the folders.  
4. Run a docker container.  
   Within this docker container, it is necessary to:
    - Create [docker volumes](https://docs.docker.com/storage/volumes/) to "connect" the data we store locally on our host with the storage of the container.  
      Do it for both directories that store the blockchain data (`opt/waves-node/data`) and the configuration file (`/opt/waves-node/conf`).  
      It will "link" the data from your host to the container's storage to `/var/lib/waves` for the blockchain data and `/etc/waves` for the configuration file.  
      In case you would stop or restart the container, the blockchain copy and the configuration file will be cached locally on your computer, so no data will be lost after re-start.  
    - [Map](https://docs.docker.com/config/containers/container-networking/) the container port to the localhost port.
    - Insert the [Base58 encoded string of the wallet seed](#prerequisites).
    - Type a password that would be stored locally on your host to protect the `wallet.dat` file.

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

5. To make sure everything is working properly, we can check logs.  
    Copy the ID of the running docker container after running the command:
    
    ```
    docker ps
    ```
    It may look something like this:   
    ```
    CONTAINER ID 
    c3f7dacea0d4
    ```

    Write the command to see the logs of the running container with the container ID:

    ```
    docker logs c3f7dacea0d4
    ```

    You will see multiple lines of logs.  
    Please, note it may take a few moments to deploy a node.  
    Once you see notifications about the height of the blockchain, it means everything is working properly:

    ```
    INFO [appender-25] c.w.s.BlockchainUpdaterImpl - New height: 100
    ```
    

All done! You have a working node deployed within your docker container!  
In the next lesson, [node configuration](), we will learn how to setup a configuration file of your node.  


### Deb Package Installation ###

Multiple Ubuntu/Debian users may install a node with deb-package.<br>
Follow the steps below to install a Waves node:
1. Download the [latest waves deb package](https://github.com/wavesplatform/Waves/releases), `waves_<version number>_all.deb`.
2. Install it with the following command:

    ```
    sudo dpkg -i waves_<version number>_all.deb
    ```
    For example:  
    
    ```
    sudo dpkg -i waves_1.4.7_all.deb
    ```

3.  Study the minimum configuration parameters.  
    It will be necessary to edit the configuration file to run a node.  
    The file contains multiple parameters related to the wallet, blockchain, rest-api, etc.  
    Within this lesson, we don't have a goal to configure them all, as we have the lesson [Node Configurations]() dedicated to it.  
    As of now, it would be enough to run a node with minimum parameters.  

    | Parameter | Description | Example |
    | :---- | :---- | :---- |
    | password | The password you are setting up locally on your host.<br> This password will be stored locally within the `wallet.dat` file.<br>Please, save this password to not to lose the access to the account. | `password = "RandomPassword_"` |
    | seed | The seed phrase of your Waves account encoded to Base58 string. <br> If you don’t have any existing wallet, you may comment this parameter and start a node.<br>During the first run, the application will create a new wallet with a random seed for you.<br>In this case, the seed will be displayed in the application log. |  `seed = "K6XzUChB6DwTYCM1WxtVrv1BM6jTdcaBJrn6vkB3cK7qXCnqLV"` |
4. Edit and save the configuration file.  
    The node configuration file is embedded into the package and unpacked to the folder:    
    `/usr/share/waves/conf/waves.conf` with symlink to `/etc/waves/waves.conf`  

    To edit the file, run the command:

    ```
    sudo nano /usr/share/waves/conf/waves.conf 
    ```

    We may remove all the modules (blockchain, rest-api, network) except the wallet module and parameters of the seed and the password.  
    Set a password and insert a seed Base58 encoded string.  
    It may look something as in the code below:  

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
5. Start a node:

    ```
    sudo systemctl start waves.service
    ```
6. Enable autoload on start:

    ```
    sudo systemctl enable waves.service
    ```
7. Check Waves app logs in journald storage:  

    ```
    journalctl -u waves.service -f
    ```

    Please, note it may take a few moments to deploy a node.  
    Once you see logs about the height of the blockchain, it means everything is working properly:  
    
    ```
    INFO [appender-22] c.w.s.BlockchainUpdaterImpl - New height: 100
    ```
Congratulations! You have a working Waves node!  
In the next lesson, [node configuration](), we will learn how to setup a configuration file of your node.  


### Waves Package Installation ###

Waves node installation via package is a more advanced way of node deployment.  
Follow the steps below to install a Waves node:
1. Install Java (OpenJDK 8).  
    Please, note, if you already have OpenJDK 11 installed, there is no need to roll it back to OpenJDK 8.  
    The node Installation is supported in both the 8th and the 11th versions.  
    ```
    sudo apt-get update
    sudo apt-get install openjdk-8-jre
    ```

    Now check the JDK version with the following command:  
    
    ```
    java -version
    ```

    If you see in the output the version is such as below or higher, you can move to the next step:  

    ```
    java version "1.8.0_201"
    Java(TM) SE Runtime Environment (build 1.8.0_201-b09)
    Java HotSpot(TM) 64-Bit Server VM (build 25.201-b09, mixed mode)
    ```

2. Create folders to store the blockchain copy and a configuration file.  

    ```
    sudo mkdir -p /opt/waves-node/{data,conf}
    sudo chown -R $(whoami) /opt/waves-node/
    ```
    This command will create 2 folders (data, conf) within `/opt/waves-node` directory.  
    After this, we give access to the current user logged in the system to writing and reading in the folders.  
    
3. Download the [latest version](https://github.com/wavesplatform/Waves/releases) of `waves-all-<version number>.jar` to the folder `/opt/waves`.
4. Download the [sample](https://github.com/wavesplatform/Waves/blob/master/node/waves-sample.conf) configuration file to `/opt/waves/conf`.  
5. Launch the terminal, move to the folder, and open the configuration file in the editor:  
   ```
   cd /opt/waves/conf
   sudo nano waves-sample.conf
   ```
6. Study the minimum parameters.  
    It will be necessary to edit the configuration file to run a node.  
    The file contains multiple parameters related to the wallet, blockchain, rest-api, etc.  
    Within this lesson, we don't have a goal to configure them all, as we have the lesson [Node Configurations]() dedicated to it.  
    As of now, it would be enough to run a node with minimum parameters.  

    | Parameter | Description | Example |
    | :---- | :---- | :---- |
    | password | The password you are setting up locally on your host.<br> This password will be stored locally within the `wallet.dat` file.<br>Please, save this password to not to lose the access to the account. | `password = "RandomPassword_"` |
    | seed | The seed phrase of your Waves account encoded to Base58 string. <br> If you don’t have any existing wallet, you may comment this parameter and start a node.<br>During the first run, the application will create a new wallet with a random seed for you.<br>In this case, the seed will be displayed in the application log. |  `seed = "K6XzUChB6DwTYCM1WxtVrv1BM6jTdcaBJrn6vkB3cK7qXCnqLV"` |
7. Edit and save the configuration file.  
    We may remove all the modules (blockchain, rest-api, network) except the wallet module and parameters of the seed and the password.   
    Set a password and insert a seed Base58 encoded string.  
    It may look something as in the code below:  

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
8. Run the script in the current directory to deploy a node.  
    Replace {*} with the actual file name.
    ```
    cd /opt/waves
    java -jar {*}.jar ./conf/{*}.conf
    ```
    For example:
    ```
    cd /opt/waves
    java -jar waves-all-1.4.7.jar ./conf/waves-sample.conf
    ```
9. Please, note it may take a few moments to deploy a node.  
    Once you see logs about the height of the blockchain, it means everything is working properly:

    ```
    INFO [appender-22] c.w.s.BlockchainUpdaterImpl - New height: 100
    ```
    
Congratulations!  
You would have a working node deployed!
    
In the next lesson, [node configuration](), we will learn how to setup a configuration file of your node.  