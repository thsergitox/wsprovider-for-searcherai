FROM node:20.18.1-slim

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package*.json ./
RUN chown node:node package-lock.json
USER node
RUN npm install
COPY --chown=node:node . .
EXPOSE 1234
CMD [ "npm", "start" ]