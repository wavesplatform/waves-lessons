# Waves test page#

Intro: This lesson ...

Duration: 0 min

- [One]()
- [Two]()
  - [Two One]()
  - [Two Two]()
- [Three]()

## One ##
![](./images/tree.jpeg)
<br>Random image insertion.<br>

Random code insertion.<br>

```
/@script.java
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
    }

    public URI uri() {
        return uri;
    }
}
/@script.java
```

<br>
Random video insertion.
<br>
/@video
https://www.youtube.com/watch?v=_sI_Ps7JSEk
/@video

<br>


Random code insertion.
```
/@script.ride
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
    [
      IntegerEntry(newKey, newValue), # Writing data to a key-value store
      StringEntry(newKey + "_should_be_unique", newKey) # Key must be unique
    ]
  }
}
/@script.ride
```
<br>



## Two ##

Random video insertion.<br>
/@video
https://www.youtube.com/watch?v=BwDCVvYAiT0
/@video


[![Watch the video](https://img.youtube.com/vi/T-D1KVIuvjA/maxresdefault.jpg)](https://youtu.be/T-D1KVIuvjA)