#!/bin/bash
set -e

if [ "$APP_ENV" == "production" ]
then
  npm run prod:www
else
  echo "Waiting for Rabbit MQ on ${RABBITMQ_HOST}"

  while ! nc -z "${RABBITMQ_HOST}" 5672; do sleep 3; done

  npm run dev
fi
