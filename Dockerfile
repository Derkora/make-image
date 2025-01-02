FROM ubuntu:20.04

LABEL maintainer="derkora.27@gmail.com"

ENV TZ=UTC
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Konfigurasi debconf
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && apt-get install -y --no-install-recommends \
    systemd-sysv vim nano htop ethtool tcpdump \
    net-tools pciutils iputils-ping iptables iproute2 \
    git nmap curl telnet \
    openssh-server openssh-client && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Konfigurasi default network
RUN echo "auto eno1" > /etc/network/interfaces && \
    echo "iface eno1 inet dhcp" >> /etc/network/interfaces

# Tambahkan konfigurasi DNS dengan cara aman
RUN mkdir -p /etc/systemd/resolved.conf.d && \
    echo "[Resolve]" > /etc/systemd/resolved.conf.d/custom.conf && \
    echo "DNS=8.8.8.8 8.8.4.4" >> /etc/systemd/resolved.conf.d/custom.conf

# Buat direktori kerja dan tambahkan volume
WORKDIR /root
VOLUME /root

# Konfigurasi root password
RUN echo "root:r00t" | chpasswd

# CMD untuk menjaga kontainer tetap berjalan
CMD ["/bin/bash"]
