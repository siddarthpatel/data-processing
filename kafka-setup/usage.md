## Concepts and tools used
- **Kafka cluster and brokers**: *Each kafka cluster is made of brokers. Each broker handles producers/consumers and keeps data replicated in the cluster*
- **Kafka topic**: *Category where records are published*
- **Kafka producer**: *Application or piece of code you write to write data into kafka*
- **Kafka consumer**: *Application or piece of code you write to read data from kafka*
- **Zookeeper**: *It is used to track the status of your kafka cluster such as: status of nodes, maintain a list of topics and messages*

## [Running the kafka and zookeeper container](https://kafka.apache.org/documentation/#quickstart)
Use docker compose to spin up containers that will run zookeeper and kafka. We use open source images for kafka and zookeeper setup so that we dont have explicity install all the components and tools required for kafka to run. It can be a pain in the a**. The -d means both Zookeeper and Kafka will run in the background, so you’ll have access to the Terminal after they start.
```
docker-compose -f docker-compose.yml up -d
```
Use docker cli verify that the containers and running. Docker desktop can also be used.
```
docker ps
```

![Alt text](/assets/docker-desktop.png)

## Creating a kafka topic and connecting to a kafka shell
Once Zookeeper and Kafka containers are running, you can execute the following Terminal command to start a Kafka shell
```
docker exec -it kafka /bin/sh
```

All Kafka shell scripts are located in `/opt/kafka_<version>/bin`

**Here’s the command you’ll have to issue to create a Kafka topic**

- `Note: You can either use --bootstrap-server kafka/localhost:9092 or --zookeeper zookeeper:2181`
```
kafka-topics.sh --create --topic kafka_learning --replication-factor 1 --partitions 1 --bootstrap-server kafka:9092
```
Where `kafka_learning` is the name of your topic. Since this is a dummy environment, you can keep replication-factor and [partitions](https://medium.com/event-driven-utopia/understanding-kafka-topic-partitions-ae40f80552e8#:~:text=Partitions%20are%20the%20way%20that,particular%20topic%20across%20multiple%20brokers.) at 1. 

**You can list all Kafka topics with the following command**

```
kafka-topics.sh --list --zookeeper zookeeper:2181
```
**Describe a topic**

```
kafka-topics.sh --describe --topic kafka_learning --zookeeper zookeeper:2181

Topic: kafka_learning	TopicId: eDracljQTD6nX4phmsFXSw	PartitionCount: 1	ReplicationFactor: 1	Configs:
	Topic: kafka_learning	Partition: 0	Leader: 1001	Replicas: 1001	Isr: 1001
```

**Delete a topic**

```
kafka-topics.sh --delete --topic kafka_learning --zookeeper zookeeper:2181
```

### Using producers and consumers from shell

Create a kafka topic called messages (single broker)
- exec into broker
```
docker exec -it kafka /bin/sh
```
- create a topic
```
 kafka-topics.sh --create --topic messages --replication-factor 1 --partitions 1 --bootstrap-server kafka:9092 
```

Create a kafka topic called messages (multiple brokers)
- exec into one of the brokers
```
docker exec -it data-processing-kafka-1-1 /bin/sh
```
- create topic
```
kafka-topics --create --topic messages --replication-factor 1 --partitions 5 --bootstrap-server localhost:19092,localhost:29092,localhost:39092
```

List number of brokers with ids (multiple brokers)
```
zookeeper-shell localhost:22181 ls /brokers/ids
```

Using `kafka-console-producer.sh` to write messages into our `broker` `kafka:9092` for the topic `messages`. This opens a shell console and lets us write our data. Close the shell after writing

```
kafka-console-producer.sh --topic messages --bootstrap-server kafka:9092 
>{'user_id': 1, 'recipient_id': 2, 'message': 'Hi'}
>{'user_id': 2, 'reciepient_id': 1, 'message': 'Hello there'}
```

Open a new terminal window and exec into your kafka container to verify this. We use `kafka-console-consumer.sh` to consume the messages in the `broker` with the `--from-beginning` flag to list all messages

```
kafka-console-consumer.sh --topic messages --bootstrap-server kafka:9092 --from-beginning
{'user_id': 1, 'recipient_id': 2, 'message': 'Hi'}
{'user_id': 2, 'reciepient_id': 1, 'message': 'Hello there'}
```

Without the `--from-beginning` flag you must have the producers and consumer shells running in separate terminals to write/read messages in real time. 

![Alt text](/assets/producer-consumer.png)
