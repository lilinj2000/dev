FROM node:9
MAINTAINER Linjiang Li "lilinj2000@gmail.com"
ENV REFRESHED_AT 2017-11-08

RUN npm install -g cnpm

RUN npm install -g vue-cli

ENV TZ "Asia/Shanghai"

EXPOSE 8080

CMD ["/bin/bash"]
