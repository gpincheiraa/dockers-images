FROM node:6-wheezy
#EXPOSE 9000
#IF YOU NEED PROXY
# ----------------------------------------------------------------------------------------
# Any sudo command
RUN apt-get update && apt-get install -y \
	sudo \
    ruby \
    ruby-dev

RUN gem install compass --no-ri --no-rdoc

ARG user_id

ENV USER_ID $user_id
# ----------------------------------------------------------------------------------------
# NO more sudo commands
RUN useradd -m -o -u $(echo $USER_ID) dev && echo "dev:dev" | chpasswd && adduser dev sudo && \
    mkdir -p /home/dev && mkdir -p /etc/sudoers.d \
    echo "dev:x:1000:1000:dev,,,:/home/dev:/bin/bash" >> /etc/passwd && \
    echo "dev:x:1000:" >> /etc/group && \
    sudo echo "dev ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/dev && \
    sudo chmod 0440 /etc/sudoers.d/dev && \
    chmod 4755 /usr/bin/sudo

RUN chown -R dev:dev /home/dev

USER dev
ENV HOME /home/dev
ENV PATH "$PATH:/home/dev/.npm-global/bin"

WORKDIR /home/dev/app

RUN mkdir /home/dev/.npm-global && \
    npm config set prefix '/home/dev/.npm-global'

RUN npm config set strict-ssl false && \
    npm install -g bower grunt-cli karma-cli postcss phantomjs-prebuilt es6-promise && \
    export PHANTOMJS_BIN=/home/dev/.npm-config/phantomjs

ENTRYPOINT ["/bin/sh", "-c", "/bin/bash"]
