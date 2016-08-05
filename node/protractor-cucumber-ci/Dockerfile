FROM node:slim
MAINTAINER j.ciolek@webnicer.com
WORKDIR /tmp

RUN apt-get update && \
    apt-get install -y xvfb wget openjdk-7-jre && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg --unpack google-chrome-stable_current_amd64.deb && \
    apt-get install -f -y && \
    apt-get clean && \
    apt-get install -y --force-yes libav-tools && \
    apt-get update && \
    rm google-chrome-stable_current_amd64.deb

ADD protractor.sh /protractor.sh
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

RUN useradd -ms /bin/bash dev
RUN chown -R dev:dev /home/dev
USER dev
ENV HOME /home/dev
ENV PATH "$PATH:/home/dev/.npm-global/bin"
WORKDIR /home/dev/app

RUN mkdir /home/dev/.npm-global && \
    npm config set prefix '/home/dev/.npm-global'

RUN npm config set strict-ssl false

RUN npm install -g bower protractor mocha jasmine cucumber chromedriver chai chai-as-promised grunt-cli postcss es6-promise webdriver-manager
RUN webdriver-manager update

ENTRYPOINT ["/bin/sh", "-c", "/bin/bash"]
