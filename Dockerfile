# Dockerfile for running Sigsci in Docker
# Built from instructions at https://docs.signalsciences.net/install-guides/ubuntu/agent/
FROM ubuntu:18.04

COPY sigsci-release.list /etc/apt/sources.list.d/sigsci-release.list
RUN  apt-get update; \
     apt-get install -y apt-transport-https curl gpg; \
     curl -slL https://apt.signalsciences.net/gpg.key | apt-key add -; \
     apt-get update; \
     apt-get install -y sigsci-agent=3.26.0~bionic; \
     apt-get clean

CMD ["/usr/sbin/sigsci-agent"]