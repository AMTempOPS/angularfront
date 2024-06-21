FROM node:12.22.10-slim as build

WORKDIR /app

COPY ./ /app/

RUN npm install

RUN npm run build

FROM nginx:latest

COPY --from=build /app/dist/crudtuto-Front /usr/share/nginx/html

EXPOSE 80