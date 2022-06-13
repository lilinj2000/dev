FROM centos:7
MAINTAINER Linjiang Li "lilinj2000@gmail.com"
ENV REFRESHED_AT 2017-05-15

# remove the tsflags on yum.conf
RUN sed -i 's/tsflags/# tsflags/g' /etc/yum.conf

# install man pages
RUN yum install -y man-db man-pages

# install gcc & g++
# RUN yum install -y gcc gcc-c++

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

# install emacs
RUN yum install -y emacs

# install git & svn
RUN yum install -y git subversion

# install perl support
# RUN yum install -y perl-Digest-MD5.x86_64

# install valgrind
RUN yum install -y valgrind

# install sqlite & mysql
RUN yum install -y sqlite sqlite-devel mysql mysql-devel

# clean cached data
RUN yum clean all

# install extension config & software
COPY install.sh /root/

RUN chmod 755 /root/install.sh; sync \
    && /root/install.sh; sync \
    && rm -f /root/install.sh

# install myemacs for chinese support
COPY myemacs /usr/bin/
RUN chmod 755 /usr/bin/myemacs

ENV TZ "Asia/Shanghai"

CMD ["/bin/bash"]
