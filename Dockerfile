FROM ubuntu:16.04

RUN apt-get -y update && apt-get -y install autoconf automake curl flex g++ gcc gdb git \
  krb5-admin-server krb5-kdc krb5-user libkrb5-dev libsasl2-dev libsasl2-modules \
  libsasl2-modules-gssapi-mit libssl-dev libtool lsb-release make ntp \
  openjdk-8-jdk openssl patch pkg-config python rsync unzip vim-common && \
  apt-get install doxygen gem graphviz ruby-dev xsltproc zlib1g-dev && \
  git clone https://github.com/apache/kudu && \
  cd kudu && \
  thirdparty/build-if-necessary.sh && \
  mkdir -p build/release && \
  cd build/release && \
  ../../thirdparty/installed/common/bin/cmake \
  -DCMAKE_BUILD_TYPE=release \
  ../.. && \
  make -j4 && \
  make DESTDIR=/opt/kudu install

#VOLUME /var/lib/kudu/master /var/lib/kudu/tserver

#COPY docker-entrypoint.sh /
#ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 8050 8051 7050 7051
#CMD ["help"]
