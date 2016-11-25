FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y build-essential curl

RUN curl -sL https://deb.nodesource.com/setup_5.x | sudo -E bash -
RUN apt-get -y install nodejs
ENTRYPOINT ["node"]

