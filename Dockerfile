FROM ubuntu:22.04

LABEL maintainer="nevarre"
LABEL description="Ubuntu 22.04 that designed to be used in network practices"

VOLUME /root

ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    systemd-sysv systemd nano vim htop ethtool tcpdump mtr-tiny socat \
    net-tools pciutils iputils-ping iptables iproute2 traceroute \
    nmap curl telnet wget build-essential iperf3 knot-host rsyslog \
    openssh-server openssh-client && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean && \
    apt-get autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/cache/* && \
    rm -rf /var/lib/log/* 

CMD ["/bin/bash"]
