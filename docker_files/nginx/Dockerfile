FROM node:12-alpine as builder

# copy the package.json to install dependencies
COPY ./mowa-ui/package*.json ./

# Install the dependencies and make the folder
RUN npm install && mkdir -p /usr/src/mowa-ui && mv ./node_modules /usr/src/mowa-ui

WORKDIR /usr/src/mowa-ui

COPY ./mowa-ui .

RUN npm run build

FROM nginx:alpine

#!/bin/sh

COPY ./docker_files/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./docker_files/nginx/conf.d/ /etc/nginx/conf.d/

EXPOSE 3000 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]