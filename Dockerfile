FROM docker:dind
LABEL maintainer="lilinj2000@gmail.com"
ENV REFRESHED_AT 2021-03-05

# install python
RUN apk update && apk --no-cache add python3 curl

# install pip
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py; python3 get-pip.py; rm get-pip.py

RUN pip install docker-compose

ENV TZ "Asia/Shanghai"

# CMD ["/bin/bash"]



