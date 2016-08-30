FROM ubuntu:16.04
MAINTAINER Nan Liu <nan.liu@gmail.com>

ARG SNAP_VERSION
ARG BUILD_DATE

ENV SNAP_TRUST_LEVEL=0
ENV SNAP_LOG_LEVEL=1
ENV GOPATH /home/root/go
ENV PATH $PATH:/usr/local/go/bin:$GOPATH/bin

LABEL vendor="Intelsdi-X" \
      name="Ubuntu 16.04 Snap ${SNAP_VERSION}" \
      license="Apache 2.0" \
      build-date=$BUILD_DATE \
      io.snap-telemetry.snap.version.is-beta= \
      io.snap-telemetry.snap.version=$SNAP_VERSION

EXPOSE 8181

RUN apt-get update && \
    (apt-get install -y curl git make || apt-get install -o Acquire::BrokenProxy=true -o Acquire::http::Pipeline-Depth="0" -y curl git make) && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY install_snap /usr/local/bin/install_snap
RUN /usr/local/bin/install_snap
COPY snapd.conf /etc/snap/snapd.conf

COPY install_plugins /usr/local/bin/install_plugins
RUN /usr/local/bin/install_plugins

COPY run.sh /run.sh
CMD /run.sh && bash 
