FROM node:latest

WORKDIR /app

COPY common/node/package*.json .

RUN npm install

#COPY . .

EXPOSE 3000

CMD ["npm", "start"]
