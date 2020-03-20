FROM node:12-alpine as builder
COPY ./mowa-ui/package*.json ./
RUN npm install && mkdir -p /react-ui && mv ./node_modules /react-ui
WORKDIR /react-ui
COPY ./mowa-ui .
RUN npm run build

FROM nginx:alpine

#!/bin/sh

COPY ./docker_files/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./docker_files/nginx/conf.d/ /etc/nginx/conf.d/
COPY --from=builder /react-ui /usr/src/mowa-ui

EXPOSE 3000 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]