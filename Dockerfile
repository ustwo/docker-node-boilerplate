FROM node:0.11
MAINTAINER Daniel Demmel <dain@ustwo.com>

RUN apt-get update -qyy \
  && apt-get install -qyy \
    vim \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /home/dbp
WORKDIR /home/dbp
ENV TERM=xterm-256color

COPY package.json /home/dbp/package.json
COPY app /home/dbp/app
RUN npm install && npm run-script compile

# Intended volumes to mount
# VOLUME /home/dbp/package.json
# VOLUME /home/dbp/app
EXPOSE 8888
CMD [ "npm", "start" ]
