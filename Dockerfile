FROM centos:7
MAINTAINER Linjiang Li "lilinj2000@gmail.com"
ENV REFRESHED_AT 2017-05-15

# remove the tsflags on yum.conf
RUN sed -i 's/tsflags/# tsflags/g' /etc/yum.conf

# install man pages
RUN yum install -y man-db man-pages

# install openssl
RUN yum install -y openssl openssl-devel.x86_64

# install python package
RUN yum install -y python-setuptools && easy_install pip virtualenv

# install misc
RUN yum install -y which net-tools wget unzip file

# install ansible
RUN yum install -y ansible

# clean cached data
RUN yum clean all



ENV TZ "Asia/Shanghai"

CMD ["/bin/bash"]
