FROM node:12-alpine as builder
COPY ./mowy-ui/package*.json ./
RUN npm install && mkdir -p /react-ui && mv ./node_modules /react-ui
WORKDIR /react-ui
COPY ./mowy-ui .
RUN npm run build

FROM nginx:alpine

#!/bin/sh
ARG app_stage

COPY ./docker_files/nginx/nginx.conf /etc/nginx/nginx.conf
COPY ./docker_files/nginx/$app_stage.conf.d/ /etc/nginx/conf.d/
COPY ./docker_files/nginx/ssl/ /etc/nginx/ssl
COPY --from=builder /react-ui /usr/src/mowy-ui

EXPOSE 3000 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]