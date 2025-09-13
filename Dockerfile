FROM debian:stable-slim

LABEL maintainer="nevarre"
LABEL description="Lightweight Debian with networking tools for GNS3."

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    bash \
    nano \
    iputils-ping \
    net-tools \
    iproute2 \
    dnsutils \
    curl \
    wget \
    traceroute \
    tcpdump \
    nmap \
    openssh-client \
    iperf3 \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root
VOLUME /root

CMD ["/bin/bash"]
