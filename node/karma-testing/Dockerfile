FROM node:0.12-wheezy
#EXPOSE 9000
# ----------------------------------------------------------------------------------------
# Any sudo command
RUN apt-get update && apt-get install -y \
    ruby \ 
    ruby-dev

RUN gem install compass --no-ri --no-rdoc

# ----------------------------------------------------------------------------------------
# NO more sudo commands
RUN useradd -ms /bin/bash dev

RUN chown -R dev:dev /home/dev

USER dev
ENV HOME /home/dev
ENV PATH "$PATH:/home/dev/.npm-global/bin"

WORKDIR /home/dev/app

RUN echo "function parse_git_branch () {" >> ~/.profile && echo "  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'" >> ~/.profile && echo "}" >> ~/.profile && \
    echo "YELLOW=\"\[\033[0;33m\]\"" >> ~/.profile && echo "GREEN=\"\[\033[0;32m\]\"" >> ~/.profile && \
    echo "NO_COLOR=\"\[\033[0m\]\"" >> ~/.profile && echo "PS1=\"$GREEN\u@\h$NO_COLOR:\w$YELLOW\$(parse_git_branch)$NO_COLOR\$ \"" >> ~/.profile


RUN mkdir /home/dev/.npm-global && \
    npm config set prefix '/home/dev/.npm-global'

RUN npm config set strict-ssl false && \
    npm install -g bower grunt-cli karma-cli postcss phantomjs es6-promise cucumber && \
    export PHANTOMJS_BIN=/home/dev/.npm-config/phantomjs

ENTRYPOINT ["/bin/sh", "-c", "/bin/bash"]

