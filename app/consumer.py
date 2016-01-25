from pykafka import KafkaClient
import os

client = KafkaClient(hosts="kafka:9092")
topic = client.topics['final_super']

balanced_consumer = topic.get_balanced_consumer(
  consumer_group=os.getenv('CONSUMER_GROUP', "group"),
  auto_commit_enable=True,
  zookeeper_connect='zk:2181'
)

for message in balanced_consumer:
  if message is not None:
    print message.offset, message.value