#Use a debian wheezy with node0.12 image as base
FROM node:0.12-wheezy

#Install Java and Maven
RUN apt-get update && \
  	apt-get install -y --no-install-recommends apt-utils openjdk-7-jdk maven subversion && \
  	rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64

#Setting a custom user
RUN useradd -ms /bin/bash dev
RUN chown -R dev:dev /home/dev
USER dev
ENV HOME /home/dev
ENV PATH "$PATH:/home/dev/.npm-global/bin"
WORKDIR /home/dev/app

#Setting npm and install global packages
RUN mkdir /home/dev/.npm-global && \
    npm config set prefix '/home/dev/.npm-global' && \
    npm install -g bower@^1.3.12 gulp@^3.8.11

#Entry point: The console for work in development
ENTRYPOINT "/bin/bash"