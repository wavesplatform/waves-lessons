 k## 1st Chapter ##
Welcome to the 1st Chapter!

### 1st Semi-chapter of the 1st Chapter ###
Lorem ipsum lorem ipsum!
It is the first nested chapter.    
![Rock](./img/elixir.png)    

#### 1st Semi-chapter of the 1st semi-chapter ####
Here we're diving one level deeper within the same semi-chapter.
#### 2nd Semi-chapter of the 1st semi-chapter ####
Here we're diving one level deeper within the same semi-chapter.
#### 3rd Semi-chapter of the 1st semi-chapter ####
Here we're diving one level deeper within the same semi-chapter.    
Watch the first video    
[![Watch the first video](https://www.formula1.com/content/dam/fom-website/manual/Misc/2022manual/F1Manager/F1Manager2022_Key_Art_4K.jpg)](https://youtu.be/ZRrwjiUkUWk)

[](634bbd8a-52ed-4a7a-ae56-623667b59eb3#chapter)

### 2nd Semi-chapter of the 1st Chapter ###
Lorem ipsum lorem ipsum!
It is the second nested chapter.

### 3rd Semi-chapter of the 1st Chapter ###
#### 1st Semi-chapter of the 2nd semi-chapter ####
Here we're diving one level deeper within the same semi-chapter.
#### 2nd Semi-chapter of the 2nd semi-chapter ####
Here we're diving one level deeper within the same semi-chapter.    

#### Random forth level header ####

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

---

## 2nd Chapter ##
Welcome to the 2nd Chapter!    
Watch the third video    
[![Watch the third video](https://img.youtube.com/vi/T-D1KVIuvjA/maxresdefault.jpg)](https://youtu.be/34Na4j8AVgA)
    Here it is a separated JAVA code injected:    

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

</CodeBlock>

---

## 3rd Chapter ##
Welcome to the 3rd Chapter!    
![cake](./img/shrek.png)    

//Test

1. Таблица для теста % ширины столбцов
| Name [30%] | Description [50%]| Example [20%] |
| :---: | :--- | ---: |
| Test | Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum:<br>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum;<br>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.| `null` |
| RandomID | Lorem ipsum dolor sit amet, consectetur adipiscing elit, borum. | `asda2312nfdsbfsdkfbkj21jk3hm21djjfjfjfjfkfjmhhfdfdf` |
| List inside a table | There are three important steps:<br>1. First step;<br>2. Second step with `id`;<br>3.Third step lorem ipsum lorem ipsum lorem ipsum lorem ipsum. | lorem ipsum | 

2. Таблица для теста % ширины столбцов
| Name [10%] | Description [40%]| Example [50%] |
| :--- | :--: | :---: |
| [Issue transaction]() | 3 | - 1 for [reqular token]()<br> - 0.001 for [non-fungible token]() |
| [Transfer transaction]() | 4 | 0.001 | 
| [Create alias transaction]() | 10 | 0.001 |
| [test]() | s nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum:<br>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. | s nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum:<br>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. |