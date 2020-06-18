# Work around fluent's busybox lack of shell and tools with multi-stage
FROM alpine:3
ADD https://github.com/just-containers/s6-overlay/releases/download/v2.0.0.1/s6-overlay-amd64.tar.gz /tmp/
RUN gunzip -c /tmp/s6-overlay-amd64.tar.gz | tar -xf - -C /tmp

FROM fluent/fluent-bit:1.4.6-debug
COPY --from=0 /tmp /
COPY ./etc /etc

ENTRYPOINT ["/init"]
