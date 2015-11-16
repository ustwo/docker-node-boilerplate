FROM node:5

MAINTAINER Daniel Demmel <dain@ustwo.com>

WORKDIR /usr/local/src

ENV TERM=xterm-256color
ENV NODE_ENV=production

COPY package.json /usr/local/src/package.json
RUN npm install

COPY gulpfile.js /usr/local/src/gulpfile.js
COPY .babelrc /usr/local/src/.babelrc
COPY src /usr/local/src/src
RUN npm run compile

VOLUME /usr/local/src/logs

EXPOSE 8877

CMD ["babel-node", "src/server"]
