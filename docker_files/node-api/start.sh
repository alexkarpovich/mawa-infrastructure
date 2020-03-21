#!/bin/bash
set -e

echo "Waiting for Rabbit MQ on ${RABBITMQ_HOST}"

until timeout 1 bash -c "cat < /dev/null > /dev/tcp/${RABBITMQ_HOST}/5672"; do
  >&2 sleep 3
done

npm run dev
