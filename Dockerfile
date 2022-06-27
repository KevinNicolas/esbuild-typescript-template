FROM node:14-alpine

ARG GITUSERNAME
ARG GITEMAIL
ARG SSHFILENAME

# Git
RUN apk add git
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -p git

# Ssh
RUN apk add openssh
COPY ./.devcontainer/.ssh /root/.ssh
RUN mv /root/.ssh/${SSHFILENAME} /root/.ssh/id_rsa
RUN mv /root/.ssh/${SSHFILENAME}.pub /root/.ssh/id_rsa.pub
RUN chmod 400 /root/.ssh/id_rsa
RUN chmod 400 /root/.ssh/id_rsa.pub

RUN git config --global user.name ${GITUSERNAME}
RUN git config --global user.email ${GITEMAIL}

COPY . /app
WORKDIR /app

CMD zsh