FROM node:6-slim

VOLUME ["/usr/local/bin/docker"]

# Adding a user
RUN useradd -ms /bin/bash dev
RUN chown -R dev:dev /home/dev

# Adding user to the docker group
USER root
RUN usermod -aG docker dev

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
