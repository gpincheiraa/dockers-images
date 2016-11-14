FROM node:6-slim


# ********** Docker Stuffs ************************

# Let's start with some basic stuff.
RUN apt-get update -qq && apt-get install -qqy \
    apt-transport-https \
    ca-certificates \
    curl \
    lxc \
    iptables
# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ | sh

# Install the magic wrapper.
ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker

# Define additional metadata for our image.
VOLUME /var/lib/docker
CMD ["wrapdocker"]


# ********** Node 6 stuffs ************************
EXPOSE 8080
EXPOSE 80
# Adding a user
RUN useradd -ms /bin/bash dev
RUN chown -R dev:dev /home/dev

# Adding user dev to the docker group and run docker service
USER root
RUN usermod -aG docker dev
CMD ["service docker start"]

#Use dev user
USER dev
ENV HOME /home/dev
ENV PATH "$PATH:/home/dev/.npm-global/bin"
WORKDIR /home/dev/app


# Installing ndoemon globally
RUN mkdir /home/dev/.npm-global && \
    npm config set prefix '/home/dev/.npm-global' && \
    npm install -g nodemon


ENTRYPOINT ["/bin/sh", "-c", "/bin/bash"]

