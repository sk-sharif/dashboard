FROM node:10 as build
WORKDIR /app
COPY package*.json /app/
RUN npm install
 COPY ./ /app/
RUN npm run build



FROM nginx:alpine

COPY --from=build /app/build/ /usr/share/nginx/html



CMD ["nginx", "-g", "daemon off;"]