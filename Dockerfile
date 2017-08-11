FROM ubuntu:16.04
MAINTAINER Linjiang Li "lilinj2000@gmail.com"
ENV REFRESHED_AT 2017-08-10

RUN apt-get update

# install man pages
RUN apt-get install -y man-db manpages manpages-dev

# install gcc & g++
RUN apt-get install -y gcc g++

# install autotools
RUN apt-get install -y autotools-dev autoconf automake

# install cmake
RUN apt-get install -y cmake cmake-curses-gui

# install gdb
RUN apt-get install -y gdb

# install openssl
RUN apt-get install -y openssl

# install python package
RUN apt-get install -y python-setuptools && easy_install pip virtualenv

# install misc
RUN apt-get install -y net-tools curl wget unzip file

# install emacs
RUN apt-get install -y emacs

# install git & svn
RUN apt-get install -y git subversion

# install perl support
# RUN apt-get install -y perl-Digest-MD5.x86_64

# install valgrind
RUN apt-get install -y valgrind && apt-get clean

# install sqlite & mysql
RUN apt-get install -y sqlite libsqlite3-dev mysql-client 

# clean cached data
RUN apt-get clean

# install extension config & software
COPY install.sh /root/

RUN chmod 755 /root/install.sh && /root/install.sh && rm -f /root/install.sh

# install myemacs for chinese support
COPY myemacs /usr/bin/
RUN chmod 755 /usr/bin/myemacs

CMD ["/bin/bash"]
 

