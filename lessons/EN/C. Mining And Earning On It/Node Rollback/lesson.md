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

In case you don't update your node in time after a mandatory update,  your node may switch to a fork.  
The risks of staying in a fork are that at one moment the node may stop working.  
As a consequence of a non-functioning node, there will be no opportunity to generate a block and receive a reward.  
  
In this scenario, to make your node work properly, it will be necessary to update your node and roll back.  
Firsly, we eliminate the very issue why our node went to the fork, i.e. we install the necessary updates that were absent.  
Secondly, we rollback our node to the height before the certain feature was activated that caused fork.  
Rolling back a node is a way to restore the node blockchain height to the moment before the fork occurred.  

The best way to get the idea is to watch it working on the live example.  
We will return to our fictional blockchain instance, where the blochcain split into two chains at the 100th block:  
![](./images/noderoll.png)

At the moment of the 102th block, we found out that we were on the fork:  
![](./images/102block.png)

In this situation, we will need to roll back the node from the fork's 102th block to the 100th block before the split occurred.  
![](./images/102to100.png)

## How to rollback a node ###

1. Чекаем высоту нашей ноды и блокчейна.
Например, высота 100.
2. От этой высоты вычитаем 10.
100 - 10 = 90
Делаем еще раз спустся 20 минут если не совпадают - 
3. На 90 блоке проверяем хэдеры, а именно значение signature.
4. 
Если signature ноды и блокчейна совпадают - можно выдохнуть и ждать новых обновлений.
Если signature ноды и блокчейна не совпадают - обновляю ноду и откачиваю на 2000 блоков назад. Только в случае ошибки - заново выкачиваю блокчейн.