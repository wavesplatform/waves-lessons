docker run \
-v /docker/waves/waves-data:/var/lib/waves \
-v /docker/waves/waves-config:/etc/waves \
-p 6870:6870 \
-p 6868:6868 \
-e JAVA_OPTS="
-Dwaves.network.declared-address=0.0.0.0:6868 
-Dwaves.network.node-name=-my-testnet-node 
-Dwaves.rest-api.api-key-hash=6nSftY1F5kurz23yLrT1r9YJpiEveBLEa9RB1SCChiqv 
-Dwaves.rest-api.bind-address=0.0.0.0 
-Dwaves.rest-api.port=6870" \
-e WAVES_WALLET_SEED="glove cruel useful wasp lift phone frown lend execute become long ranch mansion fitness faith" \
-e WAVES_WALLET_PASSWORD="Lancelot77_" \
-e WAVES_NETWORK=mainnet \
-ti wavesplatform/wavesnode 


3P3m7ANtNezZMdCcj1dd4SRqJLPWKpBiX6y

glove cruel useful wasp lift phone frown lend execute become long ranch mansion fitness faith


docker run -d --name waves-private-nodee -p 6869:6869 -e WAVES_WALLET_SEED="glove cruel useful wasp lift phone frown lend execute become long ranch mansion fitness faith" -e WAVES_WALLET_PASSWORD="Lancelot77_" wavesplatform/waves-private-node:latest


 docker run -d --name waves-private-nodee -p 6869:6869 --platform linux/amd64 -e WAVES_WALLET_SEED="glove cruel useful wasp lift phone frown lend execute become long ranch mansion fitness faith" -e WAVES_WALLET_PASSWORD="Lancelot77_" wavesplatform/waves-private-node:latest



# PRIVATE
docker run -d --name waves-private-node \
-p 6869:6869 \
--platform linux/amd64 \
-e WAVES_WALLET_SEED="glove cruel useful wasp lift phone frown lend execute become long ranch mansion fitness faith" \
-e WAVES_WALLET_PASSWORD="Lancelot77_" \
wavesplatform/waves-private-node:latest

# PUBLIC
docker run -d --name my-waves-node \
-p 6869:6869 \
-p 6862:6862 \
--platform linux/amd64 \
-e WAVES_WALLET_SEED="2DrRSwCH2WctDnC4WnG8QVoKiLXfownWKxCrsQSwQ7eZnRzN6cz2NQJ71YAmnVeWgj7GbyXfNiL45PLgPNygjuezo2jyRCZmJ5UdnDDk3CPCRjpRhNzcew6CKKthn" \
-e WAVES_WALLET_PASSWORD=Lancelot77_ \
wavesplatform/wavesnode:latest


    docker run -d \
     --name my-waves-node \
     -p 6869:6869 \
     --platform linux/amd64 \
     -e WAVES_WALLET_SEED="K6XzUChB6DwTYCM1WxtVrv1BM6jTdcaBJrn6vkB3cK7qXCnqLV2Jj1UgdEzr2dF98PChALCzbkF3Ni1cBFKanXErzuBdJaeFc2etFDBLjdov47qsfTx5bHxx5Uv" \
     -e WAVES_WALLET_PASSWORD="Lancelot77)" \
     wavesplatform/wavesnode:latest

http://127.0.0.1:6869/

-----

waves {

  wallet {
    # Password to protect wallet file
    password="Lancelot77_!"

    # Wallet seed as BASE58 string
    seed="R2nnbazCsUn1ihTC5mhTNSe1UZ2bNmyn966HV76rWQHKBWpZpwnSDj155aon7c6WTdtHZpdabL9p6ke1aR2c9SiwBKb6SsfYKrGktzbT3U8QQnftZ1MK8F4wB5eNgL7"
  }

  blockchain {
    # Blockchain type: TESTNET | MAINNET | STAGENET | CUSTOM
    type = MAINNET
  }

  rest-api {
    # Enable/disable REST API
    enable = yes

    # Network address to bind to
    bind-address = "127.0.0.1"

    # Port to listen to REST API requests
    port = 6869

    # Hash of API key string
    api-key-hash = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzaWciOiIzUW5lV2pUd2Y0WjJhYzdRTWlDRmtUNll4cGVMQWFQTnB6TFVta0xBZThNYXdBNUJzM21tcjYxZDllTllUUFRNMVZXUEpyRDF4VkZNNXllZlRkUzJrYXhBIiwiYSI6IjNQM203QU50TmV6Wk1kQ2NqMWRkNFNScUpMUFdLcEJpWDZ5IiwibmIiOiJXIiwidXNlcl9uYW1lIjoiN1ZxWDhkalFGYktrTXd4bXUxWVcxVlU2Zkd2ZEtjTXp6N013VGlIa1pxQlAiLCJzY29wZSI6WyJnZW5lcmFsIl0sImx0Ijo4NjQwMCwicGsiOiI3VnFYOGRqUUZiS2tNd3htdTFZVzFWVTZmR3ZkS2NNeno3TXdUaUhrWnFCUCIsImV4cCI6MTY1ODM5Mzg5NCwiZXhwMCI6MTY1ODMyMTUzMywianRpIjoiZmUyYzZmNmYtZTA0My00ZTEyLWJmODQtM2I3NWNmYjY3NWJiIiwiY2lkIjoid2F2ZXMuZXhjaGFuZ2UifQ.Yi6K6TtV_Zz4g6vgc0vBoIh1TNfeILgl9qDBBft5DYUqVxIOY-Yijx7JD4K9W7rt2hifmZI9v4JRtSDA0o8Na-SGYLuQ2sD3VH2tTqPvX3NDpLoJ3y9PdtZ618knzwE7TGkRErL20pa7O0Z6NVfHxhAZDiM_KUuFT5d271MHCOXustMvCFvpn4tuROc6T00Wik71baoxaCqWJTSuwx1-wKhRdqsGT2HI_4QGYQYYBbw2a9sdXYXIYnT8pkJ0cNqtIvLCVjwJqEYjMThH47Y-xZLBMCfxxMD0Pj2mvBG8YSUy3A6oBzgMq5c7XH3kiaytLwbYU86LxSD3If4Cm3uBNg"
  }

  network {
    # Node name to send during handshake. Comment this string out to set random node name.
    node-name = "waves-test-default-node-name"
  }

  # Uncomment to enable the gRPC extension
  # extensions += com.wavesplatform.api.grpc.GRPCServerExtension
}

---

waves {

  wallet {
    # Password to protect wallet file
    password="Lancelot77_"

    # Wallet seed as BASE58 string
    seed="R2nnbazCsUn1ihTC5mhTNSe1UZ2bNmyn966HV76rWQHKBWpZpwnSDj155aon7c6WTdtHZpdabL9p6ke1aR2c9SiwBKb6SsfYKrGktzbT3U8QQnftZ1MK8F4wB5eNgL7"
  }

  blockchain {
    # Blockchain type: TESTNET | MAINNET | STAGENET | CUSTOM
    type = MAINNET
  }

  rest-api {
    # Enable/disable REST API
    enable = yes

    # Network address to bind to
    bind-address = "127.0.0.1"

    # Port to listen to REST API requests
    port = 6869

    # Hash of API key string
    api-key-hash = "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzaWciOiIzUW5lV2pUd2Y0WjJhYzdRTWlDRmtUNll4cGVMQWFQTnB6TFVta0xBZThNYXdBNUJzM21tcjYxZDllTllUUFRNMVZXUEpyRDF4VkZNNXllZlRkUzJrYXhBIiwiYSI6IjNQM203QU50TmV6Wk1kQ2NqMWRkNFNScUpMUFdLcEJpWDZ5IiwibmIiOiJXIiwidXNlcl9uYW1lIjoiN1ZxWDhkalFGYktrTXd4bXUxWVcxVlU2Zkd2ZEtjTXp6N013VGlIa1pxQlAiLCJzY29wZSI6WyJnZW5lcmFsIl0sImx0Ijo4NjQwMCwicGsiOiI3VnFYOGRqUUZiS2tNd3htdTFZVzFWVTZmR3ZkS2NNeno3TXdUaUhrWnFCUCIsImV4cCI6MTY1ODM5Mzg5NCwiZXhwMCI6MTY1ODMyMTUzMywianRpIjoiZmUyYzZmNmYtZTA0My00ZTEyLWJmODQtM2I3NWNmYjY3NWJiIiwiY2lkIjoid2F2ZXMuZXhjaGFuZ2UifQ.Yi6K6TtV_Zz4g6vgc0vBoIh1TNfeILgl9qDBBft5DYUqVxIOY-Yijx7JD4K9W7rt2hifmZI9v4JRtSDA0o8Na-SGYLuQ2sD3VH2tTqPvX3NDpLoJ3y9PdtZ618knzwE7TGkRErL20pa7O0Z6NVfHxhAZDiM_KUuFT5d271MHCOXustMvCFvpn4tuROc6T00Wik71baoxaCqWJTSuwx1-wKhRdqsGT2HI_4QGYQYYBbw2a9sdXYXIYnT8pkJ0cNqtIvLCVjwJqEYjMThH47Y-xZLBMCfxxMD0Pj2mvBG8YSUy3A6oBzgMq5c7XH3kiaytLwbYU86LxSD3If4Cm3uBNg"
  }

  network {
    # Node name to send during handshake. Comment this string out to set random node name.
    node-name = "waves-test-default-node-name"
  }

    # Uncomment to enable the gRPC extension
    # extensions += com.wavesplatform.api.grpc.GRPCServerExtension
}