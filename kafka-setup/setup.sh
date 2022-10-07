echo "Enter an option (1 or 2) for the number of kafka brokers and zookeeper servers configuration"
echo "1. ONE kafka broker and ONE zookeeper server config"
echo "2. THREE kafka brokers and THREE zookeeper servers config"

read varname

if [[ "${varname}" == "1" ]];then
    echo "ONE kafka broker architecture"
    echo "Running docker-compose"
    docker-compose -f ./docker-compose.yml up -d
    echo "Listing running containers"
    docker ps
elif [[ "${varname}" == "2" ]];then
    echo "THREE kafka broker architecture"
    echo "Running docker-compose"
    docker-compose -f ./docker-compose-2.yml up -d
    echo "Listing running containers"
    docker ps
else
    echo "invalid input"
fi

# multiple kafka brokers and zoopkers server config

# docker exec -it  data-processing-kafka-1-1  /bin/sh
# cd /opt/bin

# list number of brokers with ids
# zookeeper-shell localhost:22181 ls /brokers/ids

# create topic with 5 partitions across 3 kafka brokers
# kafka-topics --create --topic kafka_learning --replication-factor 1 --partitions 5 --bootstrap-server localhost:19092,localhost:29092,localhost:39092

# list kafka topics on different brokers
# kafka-topics --list --bootstrap-server localhost:39092,localhost:29092,localhost:39092

# describe kafka topic partitions
# kafka-topics --describe --topic kafka_learning  --bootstrap-server localhost:39092,localhost:29092,localhost:39092

# start producer to write into any of the 3 kafka brokers
# kafka-console-producer --topic kafka_learning --bootstrap-server localhost:19092,localhost:29092,localhost:39092

# start consumer to read from any of the 3 kafka brokers
# kafka-console-consumer --topic kafka_learning --bootstrap-server localhost:19092,localhost:29092,localhost:39092