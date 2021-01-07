#$1 agent $2 server(s) .../",/"...
if [ $# = 0 ] ; then
	repoter=`hostname -I |awk '{print $1}'`
	server=$repoter
elif [ $# = 2 ] ; then
	repoter=$1
	server=$2
else
	exit 1
fi


SPAN_STRAGE_TYPE=cassandra go run ./cmd/collector/main.go --cassandra.keyspace="logs" --cassandra.servers="$server" &
go run ./cmd/agent/main.go --reporter.grpc.host-port=$repoter:14250 &
SPAN_STRAGE_TYPE=cassandra go run -tags ui ./cmd/query/main.go --cassandra.keyspace="logs" --cassandra.servers="$server" --query.ui-config=./z-ui-config.json 
#--cassandra-archive.enabled --cassandra-archive.keyspace="archives" --cassandra-archive.servers="10.0.2.15"

