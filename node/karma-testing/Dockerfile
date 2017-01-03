FROM node:0.12-wheezy
#EXPOSE 9000
#IF YOU NEED PROXY
# ----------------------------------------------------------------------------------------
# Any sudo command
RUN apt-get update && apt-get install -y \
    ruby \ 
    ruby-dev

RUN gem install compass --no-ri --no-rdoc

# ----------------------------------------------------------------------------------------
# NO more sudo commands
RUN useradd -ms /bin/bash -u 1001 dev

RUN chown -R dev:dev /home/dev

USER dev
ENV HOME /home/dev
ENV PATH "$PATH:/home/dev/.npm-global/bin"

WORKDIR /home/dev/app

RUN mkdir /home/dev/.npm-global && \
    npm config set prefix '/home/dev/.npm-global'

RUN npm config set strict-ssl false && \
    npm install -g bower grunt-cli karma-cli postcss phantomjs-prebuilt es6-promise stubby && \
    export PHANTOMJS_BIN=/home/dev/.npm-config/phantomjs

ENTRYPOINT ["/bin/sh", "-c", "/bin/bash"]
