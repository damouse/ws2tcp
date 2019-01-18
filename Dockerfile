FROM node:10.10.0-alpine

RUN npm install node-websockify@1.0.2
COPY proxy.js proxy.js

CMD echo 'Starting Proxy'; node proxy.js