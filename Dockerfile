FROM ubuntu:trusty

MAINTAINER madesst 

ENV KAFKA_VERSION="0.9.0.0" SCALA_VERSION="2.11"

RUN apt-get update && apt-get install -y unzip openjdk-7-jdk wget curl git jq

ADD download-kafka.sh /tmp/download-kafka.sh
RUN /tmp/download-kafka.sh
RUN tar xf /tmp/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -C /opt

VOLUME ["/kafka"]

ENV KAFKA_HOME /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION}
ADD start-kafka.sh /usr/bin/start-kafka.sh
ADD broker-list.sh /usr/bin/broker-list.sh
CMD start-kafka.sh