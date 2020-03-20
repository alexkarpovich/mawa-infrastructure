FROM node:12

ENV PATH="/usr/app/node_modules/.bin:${PATH}"

WORKDIR /usr/app

COPY ./mowa-api/package*.json ./
COPY ./docker_files/node-api/start.sh /usr/script/

RUN npm i
