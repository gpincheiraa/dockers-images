FROM node:0-slim
# ----------------------------------------------------------------------------------------
# Any sudo command
RUN apt-get update && apt-get install -y git


# ----------------------------------------------------------------------------------------
# NO more sudo commands
RUN useradd -ms /bin/bash gitlab-runner

RUN chown -R gitlab-runner:gitlab-runner /home/gitlab-runner

USER gitlab-runner
ENV HOME /home/gitlab-runner
ENV PATH "$PATH:/home/gitlab-runner/.npm-global/bin"

WORKDIR /home/gitlab-runner/app

RUN mkdir /home/gitlab-runner/.npm-global && \
    npm config set prefix '/home/gitlab-runner/.npm-global'

RUN npm config set strict-ssl false && \
    npm install -g bower 
ENTRYPOINT ["/bin/sh", "-c", "/bin/bash"]
#CMD ["bower", "install"]
