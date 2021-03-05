FROM centos:7
LABEL maintainer="lilinj2000@gmail.com"
ENV REFRESHED_AT 2021-03-05

# remove the tsflags on yum.conf
RUN sed -i 's/tsflags/# tsflags/g' /etc/yum.conf

# install man pages
RUN yum install -y man-db man-pages

# install docker
RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN yum install -y docker-ce docker-ce-cli

# install pip
RUN yum install -y python2-pip

RUN pip install virtualenv docker-compose

# clean cached data
RUN yum clean all

ENV TZ "Asia/Shanghai"

CMD ["/bin/bash"]



