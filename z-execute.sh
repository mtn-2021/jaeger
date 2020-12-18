SPAN_STRAGE_TYPE=cassandra go run ./cmd/collector/main.go --cassandra.keyspace="logs" --cassandra.servers="10.0.2.15" &
go run ./cmd/agent/main.go --reporter.grpc.host-port=10.0.2.15:14250 &
SPAN_STRAGE_TYPE=cassandra go run -tags ui ./cmd/query/main.go --cassandra.keyspace="logs" --cassandra.servers="10.0.2.15" --query.ui-config=./z-ui-config.json 
#--cassandra-archive.enabled --cassandra-archive.keyspace="archives" --cassandra-archive.servers="10.0.2.15"

