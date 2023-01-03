
# elm doesn't work under alpine 6 or 8
FROM node:6-slim AS elm-build
WORKDIR /home/node/app

RUN apt-get update && \
    apt-get install -y netbase

RUN npm install -g npx && \
    npm install -g elm@0.18.0-exp5 --silent

COPY elm-package.json ./

RUN elm package install -y

COPY . .

RUN elm make Main.elm --output=client/index.js