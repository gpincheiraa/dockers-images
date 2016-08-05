FROM node:slim
MAINTAINER j.ciolek@webnicer.com
WORKDIR /tmp

RUN npm install -g protractor@3.3.0 mocha jasmine cucumber && \
    webdriver-manager update && \
    apt-get update && \
    apt-get install -y xvfb wget openjdk-7-jre && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg --unpack google-chrome-stable_current_amd64.deb && \
    apt-get install -f -y && \
    apt-get clean && \
    apt-get install -y --force-yes libav-tools && \
    apt-get update && \
    rm google-chrome-stable_current_amd64.deb

ADD protractor.sh /protractor.sh
# Fix for the issue with Selenium, as described here:
# https://github.com/SeleniumHQ/docker-selenium/issues/87
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null

RUN useradd -ms /bin/bash dev
RUN chown -R dev:dev /home/dev

USER dev

WORKDIR /home/dev/app
ENTRYPOINT ["/protractor.sh"] 