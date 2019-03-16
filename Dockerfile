FROM FROM node:11.10.1-stretch as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
