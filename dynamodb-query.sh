# Track A
aws \
--profile profile \
--region region \
dynamodb query \
--table-name TableName \
--key-condition-expression 'channel = :channel and #time BETWEEN :gt and :lt' \
--expression-attribute-names '{ "#time": "time" }' \
--expression-attribute-values '{ ":channel": { "S" : "arn:aws:ivs:ap-northeast-1:999999999999:channel/abcdefghijkl" }, ":gt": { "N": "1665187200000" }, ":lt": { "N": "1665223200000" } }' \
| jq -r '.Items[] | [.time.N, .count.N] | @csv' \
> path/file.csv
