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

http://127.0.0.1:6869/