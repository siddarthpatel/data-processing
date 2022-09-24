## [Concepts and tools used:](https://towardsdatascience.com/how-to-install-apache-kafka-using-docker-the-easy-way-4ceb00817d8b)
- **Kafka cluster and brokers**: *Each kafka cluster is made of brokers. Each broker handles producers/consumers and keeps data replicated in the cluster*
- **Kafka topic**: *Category where records are published*
- **Kafka producer**: *Application or piece of code you write to write data into kafka*
- **Kafka consumer**: *Application or piece of code you write to read data from kafka*
- **Zookeeper**: *It is used to track the status of your kafka cluster such as: status of nodes, maintain a list of topics and messages*

## Running the kafka and zookeeper container:
Use docker compose to spin up containers that will run zookeeper and kafka. We use open source images for kafka and zookeeper setup so that we dont have explicity install all the components and tools required for kafka to run. It can be a pain the a**. The -d means both Zookeeper and Kafka will run in the background, so you’ll have access to the Terminal after they start.
```
docker-compose -f docker-compose.yml up -d
```
Use docker cli verify that the containers and running. Docker desktop can also be used.
```
docker ps
```

![Alt text](/assets/docker-desktop.png)

## Creating a kafka topic:
Once Zookeeper and Kafka containers are running, you can execute the following Terminal command to start a Kafka shell
```
docker exec -it kafka /bin/sh
```

All Kafka shell scripts are located in `/opt/kafka_<version>/bin`

Here’s the command you’ll have to issue to create a Kafka topic:
```
kafka-topics.sh --create --zookeeper zookeeper:2181 --replication-factor 1 --partitions 1 --topic kafka_learning
```
Where first_kafka_topic is the name of your topic. Since this is a dummy environment, you can keep replication-factor and partitions at 1. And that’s it.The topic will be created after a second or so. You can list all Kafka topics with the following command:

```
kafka-topics.sh --list --zookeeper zookeeper:2181
```