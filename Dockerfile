FROM centos:7
LABEL maintainer="lilinj2000@gmail.com"
ENV REFRESHED_AT 2018-05-25

# remove the tsflags on yum.conf
RUN sed -i 's/tsflags/# tsflags/g' /etc/yum.conf

# install man pages
RUN yum install -y man-db man-pages

# install gcc & g++
RUN yum install -y gcc gcc-c++

# install autotools
RUN yum install -y make autoconf automake libtool

# install cmake
RUN yum install -y cmake

# install gdb
RUN yum install -y gdb

# install openssl
RUN yum install -y openssl openssl-devel.x86_64

# install python package
RUN yum install -y python-setuptools && easy_install pip virtualenv

# install misc
RUN yum install -y which net-tools wget unzip file

# install git & svn
RUN yum install -y git subversion

# install valgrind
RUN yum install -y valgrind

# install sqlite & mysql
RUN yum install -y sqlite sqlite-devel mysql mysql-devel

# clean cached data
RUN yum clean all

ENV TZ "Asia/Shanghai"

CMD ["/bin/bash"]
