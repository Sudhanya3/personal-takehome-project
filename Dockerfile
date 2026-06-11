FROM node:lts-alpine

WORKDIR /usr/src/app

COPY src/index.html /usr/src/app/
COPY src/style.css /usr/src/app/
COPY src/script.js /usr/src/app/

EXPOSE 80