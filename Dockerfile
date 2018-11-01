FROM node:alpine as build
WORKDIR /apps
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine 
COPY --from=build /apps/build /usr/share/nginx/html


