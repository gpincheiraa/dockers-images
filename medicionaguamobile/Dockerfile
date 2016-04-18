FROM node:0.12-wheezy

<<<<<<< HEAD
RUN mkdir /app && \
   npm config set strict-ssl false && \
   npm install -g bower grunt-cli karma-cli postcss phantomjs && \
   export PHANTOMJS_BIN=/home/dev/.npm-config/phantomjs

RUN apt-get update && apt-get install -y \
    ruby \ 
    ruby-dev

RUN gem install compass --no-ri --no-rdoc
   
WORKDIR /app
=======
RUN mkdir app && npm config set strict-ssl false && npm install -g bower grunt-cli karma-cli postcss phantomjs browserify && export PHANTOMJS_BIN=/usr/local/bin/phantomjs
RUN apt-get update && apt-get install -y ruby-full && gem install compass

>>>>>>> b60faa4dbf8b79c7548ec62015734e8d645dc92f

ENTRYPOINT ["/bin/sh", "-c", "/bin/bash"]
