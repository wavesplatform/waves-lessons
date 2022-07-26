RESPONSE=$(curl -X 'GET' 'https://api-dev.waves.tech/api/v1/test' \
  -H 'accept: */*' \
  -H "secret: $1")
STATUSCODE=$(jq '.status' <<< "$RESPONSE")
echo "response: $RESPONSE"
echo "status code: $STATUSCODE"
if test "$STATUSCODE" -ne 200; then
  exit 1
fi

