URL="https://$1/sync"
echo "sending GET $URL"
RESPONSE=$(curl -X 'GET' "$URL" \
  -H 'accept: */*' \
  -H "secret: $2")
STATUS=$(jq '.status' <<<"$RESPONSE")
echo "response: $RESPONSE"
if test "$STATUS" -ne "success"; then
  exit 1
fi
