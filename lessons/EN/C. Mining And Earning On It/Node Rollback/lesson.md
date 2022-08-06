## Node rollback ##

### Why to roll back your node ###

To answer the question why it is necessary to roll back a node after a fork, let's recap a few important things:
1. A **<u>[fork]()</u>** is the moment when the blockchain gets split by two different chains.  
    It occurs due to the fact that not all nodes install mandatory updates.  
    For example, a new update supports a new transaction type.  
    Some node installed the update and can add this transaction type to the transaction list of a [block]().  
    Other nodes that did not install it, won't be able to read and broadcast this transaction type.  
    It will cause a fork, where some nodes are keeping up the pace with the original blockchain, and others, not.
2. All node update releases can be either mandatory or recommended:  
    - **<u>Mandatory updates</u>** typically contain crucial updates.  
        After an update is published, it may take some time before it is actually activated.  
        In some cases it can take up to 1-2 weeks, on the [releases page](https://github.com/wavesplatform/Waves/releases) you may find information about the activation time frames.    
        In the scenario when you don't have an update installed after its activation, your node will switch to a fork.
    - **<u>Recommended updates</u>** include minor bug fixes or slight improvements.  
        Skipping such updates will not lead to a fork, however, for the best experience, are still recommended to be installed.

In case you don't update your node before a feature activation within a mandatory update, your node will switch to a fork.  
The risks of staying in a fork are that at one moment the node may stop working.  
As a consequence of a non-functioning node, there will be no opportunity to generate a block and receive a reward.  
  
In the scenario you turned out to be on a fork, it will be necessary to update your node and roll back.  
Firsly, we eliminate the very issue why our node went to the fork, i.e. we install the necessary updates that were absent.  
Secondly, we rollback our node to the height before the certain feature was activated that caused the fork.  
Rolling back a node is a way to restore the node blockchain height to the moment before the fork occurred.  
Lastly, the node will be able to synchronize with the current blockchain state and be ready to mine once again.  

The best way to get the idea is to watch it working on the live example.  
We will return to our fictional blockchain instance, where the blochcain split into two chains at the 100th block.  
A feature that was included in the update was activated at the 100th block:    
![](./images/noderoll.png)

Since we didn't update our node before the feature activation, we switched to a fork.  
At the moment of the 102th block, we found out that we were on the fork:  
![](./images/102block.png)

In this situation, we will need to:
- Update our node;
- Roll it back from the 102th block to the 100th block before the split occurred.  
    
![](./images/102to100.png)

## How to rollback a node ###

1. Check the current height of the blockchain by the [link](https://nodes.wavesnodes.com/blocks/height).  
    It can look like this:

    ```
    {"height":1000}
    ```
2. Check the blockchain height of your node via the [REST API of your node](http://localhost:6869/blocks/height).  
    Two scenarios are possible:
    - Your blockchain height is the same or is different for a few blocks.  
        It can look something like this:  

        ```
        {"height":999}
        ```
        In such a case, please, continue with the step №3 of this instruction.
    - Your blockchain height is significantly far behind the blockchain's height.  
        It can look something like this:
        
        ```
        {"height":500}
        ```  
        In this case, you will need to install the latest update as mentioned in the [Node Upgrade](#node-upgrade).  
        Please, note, that you won't need to follow this instruction below (step №3 and below).  
        After this step is completed, you can go to the [Node of the network]() chapter.
3. Verify the signature of a block of the blockchain.   
    Check the signature of the blockchain's height minus 10 by the link:
    
    ```
    https://nodes.wavesnodes.com/blocks/headers/at/{insert blockchain height minus 10}
    ```
    In our example, the blockchain height was `{"height":1000}`, therefore `1000 - 10 = 990`:  
    https://nodes.wavesnodes.com/blocks/headers/at/990

    You will see multiple different keys on the screen, but we need only the "signature" key.  
    The signature may look like this:

    ```
    "signature":"5qnRwFt4vkrvAx4jbhu7Bu8XHrxY17JkYV41nbnPEEX3euqznGg15j9i2si1K2k5rZahRiDQovwxFq459Rwewjf7"
    ```
4. Verify the signature of a block of our node's blockchain.
    Check the signature of the blockchain's height minus 10 by the link:
    
    ```
    http://localhost:6869/blocks/headers/at/{insert blockchain height minus 10}
    ```
    In our example, our node blockchain height was `{"height":999}`.  
    Yet, it could have taken some time for our node to synchronize the height with the blockchain's height (up to `{"height":1000}`).  
    Since we are aiming at checking the same height block signature, we will need to use the same height, `1000 - 10 = 990`:  
    http://localhost:6869/blocks/headers/at/990

    You will see multiple different keys on the screen, but we need only the "signature" key.  
    The signature may look like this:

    ```
    "signature":"5qnRwFt4vkrvAx4jbhu7Bu8XHrxY17JkYV41nbnPEEX3euqznGg15j9i2si1K2k5rZahRiDQovwxFq459Rwewjf7"
    ```

5. Compare the signatures 
    In this step, we need to verify if the signatures of a blockchain block and block of our node blockchain match.  
       
    Please, note that the [REST API user interface](https://nodes.wavesnodes.com/) is connecting to a random node within the Mainnet network.  
    If it was only one node, it could become unavailable or overloaded, so the REST API service would not be working.  
    For load balancing purpose, by accessing `https://nodes.wavesnodes.com`, at different times a different node may respond.   
    Due to the fact we connect to random nodes within the network via [REST API](https://nodes.wavesnodes.com/), there are chances that this particular node that responded could switch to a fork itself.   

    For this very reason, there is a very small chance we could encounter a forked node during block's headers verification step.  
   
    







<!-- 
4. Чекаем высоту нашей ноды и блокчейна.
Например, высота 100.
2. От этой высоты вычитаем 10.
100 - 10 = 90
Делаем еще раз спустся 20 минут если не совпадают - 
3. На 90 блоке проверяем хэдеры, а именно значение signature.
4. 
Если signature ноды и блокчейна совпадают - можно выдохнуть и ждать новых обновлений.
Если signature ноды и блокчейна не совпадают - обновляю ноду и откачиваю на 2000 блоков назад. Только в случае ошибки - заново выкачиваю блокчейн. -->