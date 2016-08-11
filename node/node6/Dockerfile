FROM node:6-slim

# Adding a user
RUN useradd -ms /bin/bash dev
RUN chown -R dev:dev /home/dev
USER dev
ENV HOME /home/dev
ENV PATH "$PATH:/home/dev/.npm-global/bin"
WORKDIR /home/dev/app

# Installing ndoemon globally
RUN mkdir /home/dev/.npm-global && \
    npm config set prefix '/home/dev/.npm-global' && \ 
    npm install -g nodemon


ENTRYPOINT ["/bin/sh", "-c", "/bin/bash"]
