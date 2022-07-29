URL="https://{$1}/sync"
echo "$URL"
RESPONSE=$(curl -X 'GET' "$URL" \
  -H 'accept: */*' \
  -H "secret: $2")
STATUSCODE=$(jq '.status' <<<"$RESPONSE")
echo "response: $RESPONSE"
echo "status code: $STATUSCODE"
if test "$STATUSCODE" -ne 200; then
  exit 1
fi
