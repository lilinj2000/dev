FROM node:9
MAINTAINER Linjiang Li "lilinj2000@gmail.com"
ENV REFRESHED_AT 2018-03-02

RUN npm install -g @angular/cli

ENV TZ "Asia/Shanghai"

CMD ["/bin/bash"]
