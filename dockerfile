FROM node:17-alpine3.14 as builder
WORKDIR /home/node/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder home/node/app/build /usr/share/nginx/html