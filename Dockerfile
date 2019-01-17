FROM ubuntu:trusty

RUN apt-get update && apt-get -y install wget curl && \
cd /etc/apt/sources.list.d && \
wget -qO - https://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key | apt-key add - && \
wget https://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/cloudera.list && \
apt-get update && \
apt-get -y install kudu kudu-master kudu-tserver libkuduclient0 libkuduclient-dev

#VOLUME /var/lib/kudu/master /var/lib/kudu/tserver

#COPY docker-entrypoint.sh /
#ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 8050 8051 7050 7051
#CMD ["help"]
