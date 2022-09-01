URL="https://$1/sync"
echo "sending GET $URL"
RESPONSE=$(curl --max-time 180 -X 'GET' "$URL" \
  -H 'accept: */*' \
  -H "secret: $2")
STATUS=$(jq -r '.status' <<<"$RESPONSE")
echo "status: $STATUS"
echo "response: $RESPONSE"
if [ "$STATUS" != "success" ]; then
  echo "failed to sync repository files"
  exit 1
fi
