FROM node:10
LABEL maintainer="lilinj2000@gmail.com"
ENV REFRESHED_AT 2019-09-19

RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

RUN npm config set registry https://registry.npm.taobao.org

RUN cnpm install -g create-react-app

ENV TZ "Asia/Shanghai"

CMD ["/bin/bash"]
