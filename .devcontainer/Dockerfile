FROM node:14-alpine

ARG gitUsername
ARG gitEmail
ARG sshFileName

# Git
RUN apk add git
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.2/zsh-in-docker.sh)" -p git

# Ssh
RUN apk add openssh
COPY ./.ssh /root/.ssh
RUN mv /root/.ssh/${sshFileName} /root/.ssh/id_rsa
RUN mv /root/.ssh/${sshFileName}.pub /root/.ssh/id_rsa.pub
RUN chmod 400 /root/.ssh/${sshFileName}
RUN chmod 400 /root/.ssh/${sshFileName}.pub

RUN git config --global user.name ${gitUsername}
RUN git config --global user.email ${gitEmail}

CMD zsh