FROM alpine:3.8

LABEL maintainer="Nilhcem" \
    description="Mosquitto MQTT Broker"

ENV MOSQUITTO_VERSION="1.4.15-r3"

# add user and group first so their IDs don't change
RUN addgroup -S mosquitto && \
    adduser -S -D -h /var/empty -s /sbin/nologin -G mosquitto mosquitto

# install mosquitto
RUN set -xe && \
    apk add --update --no-cache mosquitto=${MOSQUITTO_VERSION} && \
    mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log && \
    cp /etc/mosquitto/mosquitto.conf /mosquitto/config/ && \
    chown -R mosquitto:mosquitto /mosquitto

VOLUME ["/mosquitto/config", "/mosquitto/data", "/mosquitto/log"]
EXPOSE 1883

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
