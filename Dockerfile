FROM fluent/fluent-bit:1.8.6-debug
ADD https://github.com/just-containers/s6-overlay/releases/download/v2.1.0.0/s6-overlay-amd64.tar.gz /tmp/
RUN ["/usr/local/bin/sh", "-c", "/usr/local/bin/tar xzf /tmp/s6-overlay-amd64.tar.gz -C /"]

COPY ./etc /etc

ENTRYPOINT ["/init"]
