
FROM ubuntu:16.04
MAINTAINER Mihail Fedorov <kolo@komodoplatform.com>

RUN apt-get -y update && \
    apt-get -y upgrade && \
    apt-get -y install build-essential libboost-dev libssl-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD ./ .
RUN make

#ENV ZONE_NAME seed.example.org
#ENV SERVER_NAME vps.example.org
#ENV SOA_MAIL kolo.example.org.

ENTRYPOINT ./dnsseed -h $ZONE_NAME -n $SERVER_NAME -m $SOA_MAIL
