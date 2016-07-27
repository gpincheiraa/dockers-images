FROM node:slim
MAINTAINER j.ciolek@webnicer.com
WORKDIR /tmp

RUN npm install -g bower protractor mocha jasmine cucumber chromedriver chai chai-as-promised grunt-cli postcss es6-promise && \
    webdriver-manager update && \
    apt-get update && \
    apt-get install -y xvfb wget openjdk-7-jre && \
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg --unpack google-chrome-stable_current_amd64.deb && \
    apt-get install -f -y && \
    apt-get clean && \
    apt-get install -y --force-yes libav-tools && \
    apt-get update && \
    rm google-chrome-stable_current_amd64.deb && \
    mkdir /protractor

#RUN npm config set strict-ssl false && \
#    npm install -g bower grunt-cli karma-cli postcss phantomjs-prebuilt es6-promise && \
#    export PHANTOMJS_BIN=/home/dev/.npm-config/phantomjs

ADD protractor.sh /protractor.sh
# Fix for the issue with Selenium, as described here:
# https://github.com/SeleniumHQ/docker-selenium/issues/87
ENV DBUS_SESSION_BUS_ADDRESS=/dev/null
WORKDIR /protractor
ENTRYPOINT ["/bin/sh", "-c", "/bin/bash"]
