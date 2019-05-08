#!/bin/bash

echo "./send_request_to_data <TO> <DATA>"
echo "example: ./send_request_to_data 0x62650ae5c5777d1660cc17fcd4f48f6a66b9a4c2 0xd46300fd"

/usr/bin/curl -X POST -H "Content-Type: application/json" "https://ropsten.infura.io/v3/6905d95e772246e8a394ea1484d4f311" --data '
{
  "jsonrpc": "2.0",
  "id": 1,
  "method": "eth_call",
  "params": [
    {
      "to": "'$1'",
      "data": "'$2'"
    },
    "latest"
  ]
}
'

