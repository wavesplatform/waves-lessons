URL="https://$1/sync"
echo "sending GET $URL"
date
curl --version
RESPONSE=$(curl --connect-timeout 3 --max-time 180 -X 'GET' "$URL" \
  -H 'accept: */*' \
  -H "secret: $2")
date
STATUS=$(jq -r '.status' <<<"$RESPONSE")
echo "status: $STATUS"
echo "response: $RESPONSE"
if [ "$STATUS" != "success" ]; then
  echo "failed to sync repository files"
  exit 1
fi
