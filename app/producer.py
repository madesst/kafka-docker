from pykafka import KafkaClient

client = KafkaClient(hosts="kafka:9092")
print client.topics
topic = client.topics['final_super']

with topic.get_sync_producer() as producer:
  for i in range(40):
    producer.produce('test message ' + str(i ** 2))