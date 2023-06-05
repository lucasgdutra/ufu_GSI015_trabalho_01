FROM node:18 AS build
WORKDIR /app
COPY quiz/package.json .
RUN yarn install
COPY quiz .
RUN yarn build

FROM haproxy:2.4
COPY haproxy.cfg /usr/local/etc/haproxy/haproxy.cfg
COPY --from=build /app/public /usr/local/etc/haproxy/static