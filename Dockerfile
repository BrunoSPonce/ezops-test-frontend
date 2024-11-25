FROM node:14-alpine AS build
##
WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine

EXPOSE 3001

CMD ["nginx", "-g", "daemon off;"]
