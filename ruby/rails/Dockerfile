FROM ubuntu:14.04
# SUDO ---------------------------------------------------------------------------------------
#Install some requirements for ruby and building gems
RUN apt-get update -y && \ 
      apt-get install -y curl build-essential git vim libpq-dev

# Environments variables for lang
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV PATH "/usr/local/rvm/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

# -- CREATE THE USER: dev
RUN useradd -ms /bin/bash dev
RUN chown dev:dev /home/dev
RUN adduser dev sudo
RUN echo 'dev ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers


# NO SUDO ------------------------------------------------------------------------------------
USER dev
ENV HOME /home/dev

# SET THE VERSION HERE
ENV RUBY_VERSION 2.3
# --------------------

RUN mkdir /home/dev/app

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN \curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c 'source ~/.rvm/scripts/rvm'

# Install Ruby
RUN /bin/bash -l -c 'rvm requirements'
RUN /bin/bash -l -c 'rvm install $RUBY_VERSION'
RUN /bin/bash -l -c 'rvm use $RUBY_VERSION --default'
RUN /bin/bash -l -c 'rvm rubygems current'

# Install bundler
RUN /bin/bash -l -c 'gem install bundler --no-doc --no-ri'

WORKDIR /home/dev/app

EXPOSE 3000

ENTRYPOINT ["/bin/bash", "-lc", "/bin/bash"]