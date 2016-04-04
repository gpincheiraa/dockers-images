FROM node:0.12-wheezy

RUN mkdir app && npm config set strict-ssl false && npm install -g bower grunt-cli karma-cli postcss phantomjs && export PHANTOMJS_BIN=/usr/local/bin/phantomjs
RUN apt-get update && apt-get install -y ruby-full && gem install compass


ENTRYPOINT ["/bin/sh", "-c", "/bin/bash"]
