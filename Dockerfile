# FROM node:10.10.0-alpine
FROM resin/armhf-alpine-node:0.10.22-slim

# You can probably
COPY qemu-arm-static /usr/bin/qemu-arm-static

# Just doesn't work without this.
RUN npm config set strict-ssl false && \
    npm install -g ws-to-tcp@1.0.0