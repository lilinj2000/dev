FROM python:3.8
LABEL maintainer="lilinj2000@gmail.com"
ENV REFRESHED_AT 2021-02-22

COPY requirements.txt /root/requirements.txt

# install
RUN pip install -r /root/requirements.txt 

ENV TZ "Asia/Shanghai"

CMD ["/bin/bash"]
