FROM node:10

RUN mkdir /service
WORKDIR /service

# Symlink necessary to sqlite https://github.com/mapbox/node-sqlite3/issues/612
RUN ln -s "$(which nodejs)" /usr/bin/node

COPY package*.json ./

RUN npm install

COPY . .

CMD [ "nodemon", "SCIMServer.js" ]
