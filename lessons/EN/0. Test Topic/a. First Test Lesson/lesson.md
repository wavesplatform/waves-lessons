## 1st Chapter ##
Welcome to the 1st Chapter!

### 1st Semi-chapter of the 1st Chapter ###
Lorem ipsum lorem ipsum!
It is the first nested chapter.  
![Rock](./img/rock.png)  

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
<CodeBlock>

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
  StringEntry(newKey + "_should_be_unique", newKey) # Key must be unique ]
  }
}
```

</CodeBlock>

#### 3rd Semi-chapter of the 2nd semi-chapter ####
Here we're diving one level deeper within the same semi-chapter.

### 3rd Semi-chapter of the 1st Chapter ###
Lorem ipsum lorem ipsum!
It is the third nested chapter.  
Watch the second video  
[![Watch the second video](https://devblogs.microsoft.com/dotnet/wp-content/uploads/sites/10/2022/02/dotnet7-preview1.jpg)](https://youtu.be/T-D1KVIuvjA)

## 2nd Chapter ##
Welcome to the 2nd Chapter!  
Watch the third video  
[![Watch the third video](https://img.youtube.com/vi/T-D1KVIuvjA/maxresdefault.jpg)](https://youtu.be/34Na4j8AVgA)
  Insertion of multiple code examples:  

<CodeBlock>

```js
function getCookie(byname) // возвращает по имени значение, здесь не используется 
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

</CodeBlock>

---

## 3rd Chapter ##
Welcome to the 3rd Chapter!  
![cake](./img/download.png)  

NEW IMAGE
[![IMAGE ALT TEXT HERE](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXDErGIJzYKrDTrQHzawz4LkDOwAt8K2fPHJ0BPmnbYAnWnoDcHxvt2GbH_eKQCVFtbo4&usqp=CAU)](https://www.youtube.com/watch?v=FMRXfttxLoo)

Here is an example of ride code:

<CodeBlock>

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
     StringEntry(newKey + "_should_be_unique", newKey) # Key must be unique ]  
     }
}
```

</CodeBlock>

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
| :---: | :---:  | :---:  | :---: |
| [Validating node](https://docs.waves.tech/en/blockchain/node/validating-node) | 2 | 4 GB| 100 GB SSD|
| [Generating node](https://docs.waves.tech/en/blockchain/node/mining-node) | 2+ | 4+ GB| 100+ GB SSD|


| Minimum  | 1 | 2 | 3 | 
| :---: | :---:  | ---:  | :---: |
| [Van | 2 | 4 GB| 100 GB SSD|
|  node]| 23+ | 21314+ GB| 1003221+ GB SSD|


Примеры отсылок на другие md-файлы:

**Отсылки на другие мд-файлы**

1. Ссылаемся на другой урок [Waves blockchain description](ef741d9b-752d-4497-9b63-cf3ba5099e77).
2. Ссылаемся на еще один урок [Node deployment on Ubuntu with the Waves package](20f4c1b6-eb61-4b2a-a5ef-130f90e5fca0).

**Отсылки на главы других мд-файлов**

1. Отсылка на заголовок 2-го уровня - [Node deployment on Ubuntu with Docker - Installation](90f0c02-dc10-41a1-b5dc-6eb8b2eeefc8#installation)
2. Отсылка на заголовок 3-го уровня - [Node deployment on macOS with Docker - Why roll back your node](63591417-09c6-40bf-ae1e-221de605ba5d#why-roll-back-your-node)
3. Отсылка на заголовок 4-го уровня - [Second test lessons - random forth level header](148f6915-ee2b-42e6-a74b-80a1f3ef5737#random-forth-level-header)

**Вставки блоков (Warning, Info, Error)**

Вставка Warning
<Message type="warning">
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
</Message>

Вставка Info
<Message type="info">
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
</Message>

Вставка Error
<Message type="error">
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
</Message>

Пример вставки через список:
- Вставка Info на первом уровне вложенности
  <Message type="info">
  Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
  </Message>
- Вставка Warning на втором уровне вложенности
  * <Message type="warning">
    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
    </Message>
- Вставка Error на третьм уровне вложенности
  * Второй уровень
    - <Message type="error">
      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
      </Message>