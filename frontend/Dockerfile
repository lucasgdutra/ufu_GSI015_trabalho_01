# Build stage
FROM node:18 AS build
WORKDIR /app
COPY quiz/package.json .
RUN yarn install
COPY quiz .
RUN yarn build

# Production stage
FROM nginx:stable-alpine
COPY --from=build /app/public /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]