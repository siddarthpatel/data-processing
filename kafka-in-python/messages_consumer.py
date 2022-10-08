import json 
from kafka import KafkaConsumer
import sys


if __name__ == '__main__':
    # Kafka Consumer 
    if (sys.argv and sys.argv[1] == 'single'):
        consumer = KafkaConsumer(
            'messages',
            bootstrap_servers=['localhost:9092'],
            auto_offset_reset='earliest'
        )
    elif (sys.argv and sys.argv[1] == 'multi'):
        consumer = KafkaConsumer(
            'messages',
            bootstrap_servers=['localhost:19092, localhost:29092, localhost:39092'],
            auto_offset_reset='earliest'
        )
    else:
        print("Please specify arch type as single or multi")
        quit(1)
    for message in consumer:
        print(json.loads(message.value))
