FROM java:7-jre
MAINTAINER <platform@mergermarket.com> 

RUN mkdir /app

# Download version 1.4.2 of logstash
RUN cd /tmp && \
wget https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz && \
tar -xzvf ./logstash-1.4.2.tar.gz && \
mv ./logstash-1.4.2 /app/logstash && \
rm ./logstash-1.4.2.tar.gz

# Install contrib plugins
RUN /app/logstash/bin/plugin install contrib

# Copy build files to container root
ADD . /app

# Start logstash
ENTRYPOINT ["/app/bin/boot"]
