FROM node:10 as build
WORKDIR /app
COPY package*.json /app/
RUN npm install
 COPY ./ /app/
RUN npm run build



FROM nginx:alpine


COPY --from=build /app/build/ /usr/share/nginx/html
COPY --from=build /default.conf /etc/nginx/conf.d/default.conf


CMD ["nginx", "-g", "daemon off;"]