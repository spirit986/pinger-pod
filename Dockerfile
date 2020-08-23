FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y openssh-server vim nano curl netcat mysql-client wget whois telnet rsync iputils-ping iputils-tracepath ftp gawk dnsutils && \
    mkdir /var/run/sshd  && \
    mkdir -p /root/.ssh && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config && \
    apt-get -y autoclean && apt-get -y autoremove && \
    apt-get -y purge $(dpkg --get-selections | grep deinstall | sed s/deinstall//g) && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN wget https://downloads.apache.org/kafka/2.6.0/kafka_2.13-2.6.0.tgz && \
    tar zxf kafka* && \
    rm -f *.tgz && \
    ln -s kafka_2.13-2.6.0 kafka

COPY authorized_keys /root/.ssh/authorized_keys
RUN chmod 400 /root/.ssh/authorized_keys

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]

