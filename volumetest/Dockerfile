FROM node:0.12-wheezy

RUN apt-get update && apt-get install -y \
    ruby \
    ruby-dev

RUN gem install compass --no-ri --no-rdoc

RUN useradd -ms /bin/bash dev
    # cd && cp -R .bash_profile .bashrc .gitconfig .profile scripts /home/dev
ADD . /home/dev/app

RUN chown -R dev:dev /home/dev

USER dev
ENV HOME /home/dev

WORKDIR /home/dev/app

RUN mkdir /home/dev/.npm-global && \
    npm config set prefix '/home/dev/.npm-global' && \
    export PATH=/home/dev/.npm-global/bin:$PATH && \
    . /home/dev/.profile

RUN npm config set strict-ssl false && \
    npm install -g bower grunt-cli karma-cli postcss phantomjs && \
    export PHANTOMJS_BIN=/home/dev/.npm-config/phantomjs


ENTRYPOINT ["/bin/sh", "-c", "/bin/bash"]