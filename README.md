# data-processing
An introduction to data streaming/processing platforms (Kafka/Flink)

## Kafka:
Apache kakfa is a high throughput distrubted messaging system. It is primarily used to build real-time streaming data pipelines and applications that adapt to the data streams (source/target systems). It combines messaging, storage, and stream processing to allow storage and analysis of both historical and real-time data.

### Overview
- Let's say a company has a simple architecture involving 1 source and 1 target system. Sharing data i.e. writing data from source to target is a simple, fast, and an inexpesive operation. 

![Alt text](/assets/simple.png)

- Now let's say you have 4 source systems and 6 target systems and each source needs to share data with each of the targets. You end up writing 24 integrations! Each source system will have increased load from the connections to the target. Each integration for this complex architecture comes with difficulties around: 
    1) *Protocol: How data is transported (TCP, HTTP, REST,FTP,JDBC..)*
    2) *Data format: How data is parsed (binary, csv, JSON..*
    3) *Data schema & evolution: How the data is shaped and may change*

![Alt text](/assets/complex.png)

- This is where Kafka comes in. It allows decoupling of data streams and systems. The source systems will have data into Kafka (write), and the target systems will source data from Kafka (read). Kafka acts like a broker between the two and this decoupling is the power of kafka. 

![Alt text](/assets/kafka.png)

- You can have any streams of data in kafka. Such as website events, pricing data, financial transactions, user interactions. Once the data is in it can be read or put into any system you like such as a database.

![Alt text](/assets/kafka-ex.png)

### Why Kafka?
1) Now an open source project created by LinkedIn, it has a resilient architecture, is distrubuted and fault tolerant.
2) Horizontal scalability. It can scale to 100s of brokers and scale to millions of messages/second.
3) High performance  with latency of less that 10ms making it real time.
4) Used by 2000+ firms, 35% of which are fortune 500.

