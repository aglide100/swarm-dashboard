FROM ghcr.io/aglide100/docker-node-with-libvips--16

# RUN apt-get update && apt install -y tini curl
# RUN apk add --update tini curl \
#   && rm -r /var/cache
# ENTRYPOINT ["/sbin/tini", "--"]

WORKDIR /home/node/app

COPY . .

RUN npm install

# HEALTHCHECK --interval=5s --timeout=3s \
#   CMD curl --fail http://localhost:$PORT/_health || exit 1

# Run under Tini
CMD ["node", "server/index.js"]