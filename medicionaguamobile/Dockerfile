FROM node:0.12-wheezy

RUN mkdir /app && \
   npm config set strict-ssl false && \
   npm install -g bower grunt-cli karma-cli postcss phantomjs && \
   export PHANTOMJS_BIN=/home/dev/.npm-config/phantomjs

RUN apt-get update && apt-get install -y \
    ruby \ 
    ruby-dev

RUN gem install compass --no-ri --no-rdoc
   
WORKDIR /app

ENTRYPOINT ["/bin/sh", "-c", "/bin/bash"]
