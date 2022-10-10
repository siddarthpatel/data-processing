import time 
import json 
import random 
from datetime import datetime
from messages_data_generator import generate_message
import sys
from kafka import KafkaProducer


# Messages will be serialized as JSON 
def serializer(message):
    return json.dumps(message).encode('utf-8')


if __name__ == '__main__':
    # Kafka Producer
    if (sys.argv and sys.argv[1] == 'single'):
        producer = KafkaProducer(
            bootstrap_servers=['localhost:9092'],
            value_serializer=serializer
        )
    elif (sys.argv and sys.argv[1] == 'multi'):
        producer = KafkaProducer(
            bootstrap_servers=['localhost:19092', 'localhost:29092', 'localhost:39092'],
            api_version = (0, 11, 5),
            max_block_ms = 1200000,
            value_serializer=serializer
        )
    else:
        print("Please specify arch type as single or multi")
        quit(1)
    # Infinite loop - runs until you kill the program
    while True:
        # Generate a message
        dummy_message = generate_message()
        
        # Send it to our 'messages' topic
        print(f'Producing message @ {datetime.now()} | Message = {str(dummy_message)}')
        producer.send('messages', dummy_message)
        
        # Sleep for a random number of seconds
        time_to_sleep = random.randint(1, 11)
        time.sleep(time_to_sleep)