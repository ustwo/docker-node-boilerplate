FROM node:0.12

MAINTAINER Daniel Demmel <dain@ustwo.com>

WORKDIR /usr/local/src

ENV TERM=xterm-256color
ENV NODE_ENV=production

COPY package.json /usr/local/src/package.json
RUN npm install

COPY gulpfile.js /usr/local/src/gulpfile.js
COPY src /usr/local/src/src
RUN npm run compile

VOLUME /usr/local/src/logs

EXPOSE 8888

CMD ["node", "/usr/local/src/node_modules/babel/lib/_babel-node", "src/server"]
