
  - [1st Chapter](#1st-chapter)
    - [1st Semi-chapter of the 1st Chapter](#1st-semi-chapter-of-the-1st-chapter)
      - [1st Semi-chapter of the 1st semi-chapter](#1st-semi-chapter-of-the-1st-semi-chapter)
      - [2nd Semi-chapter of the 1st semi-chapter](#2nd-semi-chapter-of-the-1st-semi-chapter)
      - [3rd Semi-chapter of the 1st semi-chapter](#3rd-semi-chapter-of-the-1st-semi-chapter)
    - [2nd Semi-chapter of the 1st Chapter](#2nd-semi-chapter-of-the-1st-chapter)
    - [3rd Semi-chapter of the 1st Chapter](#3rd-semi-chapter-of-the-1st-chapter)
      - [1st Semi-chapter of the 2nd semi-chapter](#1st-semi-chapter-of-the-2nd-semi-chapter)
      - [2nd Semi-chapter of the 2nd semi-chapter](#2nd-semi-chapter-of-the-2nd-semi-chapter)
      - [3rd Semi-chapter of the 2nd semi-chapter](#3rd-semi-chapter-of-the-2nd-semi-chapter)
    - [3rd Semi-chapter of the 1st Chapter](#3rd-semi-chapter-of-the-1st-chapter-1)
  - [2nd Chapter](#2nd-chapter)
  - [3rd Chapter](#3rd-chapter)


## 1st Chapter ##
Welcome to the 1st Chapter!

### 1st Semi-chapter of the 1st Chapter ###
Lorem ipsum lorem ipsum!
It is the first nested chapter.  
![Rock](./images/rock.png)  

#### 1st Semi-chapter of the 1st semi-chapter ####
Here we're diving one level deeper within the same semi-chapter.
#### 2nd Semi-chapter of the 1st semi-chapter ####
Here we're diving one level deeper within the same semi-chapter.
#### 3rd Semi-chapter of the 1st semi-chapter ####
Here we're diving one level deeper within the same semi-chapter.  
Watch the first video  
[![Watch the first video](https://www.formula1.com/content/dam/fom-website/manual/Misc/2022manual/F1Manager/F1Manager2022_Key_Art_4K.jpg)](https://youtu.be/ZRrwjiUkUWk)

### 2nd Semi-chapter of the 1st Chapter ###
Lorem ipsum lorem ipsum!
It is the second nested chapter.

### 3rd Semi-chapter of the 1st Chapter ###
#### 1st Semi-chapter of the 2nd semi-chapter ####
Here we're diving one level deeper within the same semi-chapter.
#### 2nd Semi-chapter of the 2nd semi-chapter ####
Here we're diving one level deeper within the same semi-chapter.  

Nested code example (a few languages in a row):  
```java
package com.wavesplatform.wavesj;
 
import java.net.URI;
 
import java.net.URISyntaxException;
 
public enum Profile {
 
     MAINNET("https://nodes.wavesnodes.com/%22),
 
     TESTNET("https://nodes-testnet.wavesnodes.com/%22),
 
     STAGENET("https://nodes-stagenet.wavesnodes.com/%22),
 
     LOCAL("http://127.0.0.1:6869/%22);
 
private final URI uri;
 
   Profile(String url) {
 
       try {
 
          this.uri = new URI(url);
 
      } catch (URISyntaxException e) {
 
         throw new RuntimeException(e);
 
   }
 
} public URI uri() { return uri; } }
```
```ride
# An example of writing data as a result of a script
 
# with protection against changing the value through the script
 
{-# STDLIB_VERSION 5 #-}
 
{-# CONTENT_TYPE DAPP #-}
 
{-# SCRIPT_TYPE ACCOUNT #-}
 
@Callable(i)
 
func storeData(
 
  newKey: String,
 
  newValue: Int
 
) = {
 
 let slot = getInteger(this, newKey) # Read value by key
 
 if (isDefined(slot)) then { # Checking the value
 
    throw("key already exists") # Stop the script and throw an exception if the key is used
 
} else {
 
  [ IntegerEntry(newKey, newValue), # Writing data to a key-value store
 
  StringEntry(newKey + "_should_be_unique", newKey) # Key must be unique
 
  ]
 
  }
 
}
```


#### 3rd Semi-chapter of the 2nd semi-chapter ####
Here we're diving one level deeper within the same semi-chapter.

### 3rd Semi-chapter of the 1st Chapter ###
Lorem ipsum lorem ipsum!
It is the third nested chapter.  
Watch the second video  
[![Watch the second video](https://devblogs.microsoft.com/dotnet/wp-content/uploads/sites/10/2022/02/dotnet7-preview1.jpg)](https://youtu.be/T-D1KVIuvjA)

---

## 2nd Chapter ##
Welcome to the 2nd Chapter!  
Watch the third video  
[![Watch the third video](https://img.youtube.com/vi/T-D1KVIuvjA/maxresdefault.jpg)](https://youtu.be/34Na4j8AVgA)
  Insertion of multiple code examples:  

```js

<script> function getCookie(byname) // возвращает по имени значение, здесь не используется 

        {byname=byname+"="; 

         nlen = byname.length; 

           fromN = document.cookie.indexOf(byname)+0; 

           if((fromN) != -1) 

                {fromN +=nlen 

                 toN=document.cookie.indexOf(";",fromN)+0; 

                 if(toN == -1) {toN=document.cookie.length;} 

                 return unescape(document.cookie.substring(fromN,toN)); 

                 } 

            return null; 
         }

```

```java

package com.wavesplatform.wavesj;

import java.net.URI;

import java.net.URISyntaxException;

public enum Profile {

    MAINNET("https://nodes.wavesnodes.com/%22),      

    TESTNET("https://nodes-testnet.wavesnodes.com/%22),      

    STAGENET("https://nodes-stagenet.wavesnodes.com/%22),      

    LOCAL("http://127.0.0.1:6869/%22);

private final URI uri;    

    Profile(String url) {        

      try {          

       this.uri = new URI(url);      

      } catch (URISyntaxException e) {          

       throw new RuntimeException(e);    

      }

  } public URI uri() { return uri; }

}
```

```php

<form action="action.php" method="post">
 <p>Ваше имя: <input type="text" name="name" /></p>
 <p>Ваш возраст: <input type="text" name="age" /></p>
 <p><input type="submit" /></p>
</form>
```

```csharp

public bool GetFormsCredentials(out Cookie authCookie, out string user, out string password, out string authority)
 {
     // not use FormsCredentials unless you have implements a custom autentication.
     authCookie = null;
     user = password = authority = null;
     return false;
 }
```

```go

package main

import (
         "fmt"
         "time"
)

func main() {

          c1 := make(chan string)
          c2 := make(chan string)

          go func() {
           time.Sleep(1 * time.Second)
           c1 <- "one"
}()
          go func() {
           time.Sleep(2 * time.Second)
           c2 <- "two"
}()

         for i := 0; i < 2; i++ {
           select {
           case msg1 := <-c1:
                   fmt.Println("received", msg1)
           case msg2 := <-c2:
                   fmt.Println("received", msg2)
           }
       }
}
```

```python

def merge(dic1,dic2):

    dic3=dic1.copy()

    dic3.update(dic2)

    return dic3

dic1={1:"hello", 2:"world"}

dic2={3:"Python", 4:"Programming"}

merge(dic1,dic2) # {1: 'hello', 2: 'world', 3: 'Python', 4: 'Programming'}
```

---

## 3rd Chapter ##
Welcome to the 3rd Chapter!  
![cake](./images/download.jpeg)  

NEW IMAGE
[![IMAGE ALT TEXT HERE](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXDErGIJzYKrDTrQHzawz4LkDOwAt8K2fPHJ0BPmnbYAnWnoDcHxvt2GbH_eKQCVFtbo4&usqp=CAU)](https://www.youtube.com/watch?v=FMRXfttxLoo)

Here is an example of ride code:

```ride

# An example of writing data as a result of a script

# with protection against changing the value through the script

{-# STDLIB_VERSION 5 #-}

{-# CONTENT_TYPE DAPP #-}

{-# SCRIPT_TYPE ACCOUNT #-}

@Callable(i)

func storeData(  

   newKey: String,  

   newValue: Int

) = { 

   let slot = getInteger(this, newKey) # Read value by key  

   if (isDefined(slot)) then { # Checking the value    

          throw("key already exists") # Stop the script and throw an exception if the key is used

} else {  

      [ IntegerEntry(newKey, newValue), # Writing data to a key-value store  

     StringEntry(newKey + "_should_be_unique", newKey) # Key must be unique   

     ]  

     }

}
```


Все виды списков:

Через звездочку:
* First point
* Second point
* Third point
  
Через тире:
- First one
- Second one
- Third one

Через нумерацию:
1. First num
2. Second num
3. Third num


Пример таблицы:


| Minimum Requirements | CPU | RAM | SSD | 
| :---------- | :----------:  | :----------:  | :----------: |
| [Validating node](https://docs.waves.tech/en/blockchain/node/validating-node) | 2 | 4 GB| 100 GB SSD|
| [Generating node](https://docs.waves.tech/en/blockchain/node/mining-node) | 2+ | 4+ GB| 100+ GB SSD|


| Minimum  | 1 | 2 | 3 | 
| :----: | :-------:  | ----:  | :----------: |
| [Van | 2 | 4 GB| 100 GB SSD|
|  node]| 23+ | 21314+ GB| 1003221+ GB SSD|