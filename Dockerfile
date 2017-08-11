FROM ubuntu:16.04
MAINTAINER Linjiang Li "lilinj2000@gmail.com"
ENV REFRESHED_AT 2017-08-10

RUN apt-get update && apt-get clean

# install man pages
RUN apt-get install -y man-db && apt-get clean

# install gcc & g++
# RUN apt-get install -y gcc && apt-get clean

# install autotools
RUN apt-get install -y autotools-dev autoconf automake && apt-get clean

# install cmake
RUN apt-get install -y cmake && apt-get clean

# install gdb
RUN apt-get install -y gdb && apt-get clean

# install openssl
RUN apt-get install -y openssl && apt-get clean

# install python package
RUN apt-get install -y python-setuptools && easy_install pip virtualenv && apt-get clean

# install misc
RUN apt-get install -y which net-tools curl wget unzip file && apt-get clean

# install emacs
RUN apt-get install -y emacs && apt-get clean

# install git & svn
RUN apt-get install -y git subversion && apt-get clean

# install perl support
# RUN apt-get install -y perl-Digest-MD5.x86_64 && apt-get clean

# install valgrind
RUN apt-get install -y valgrind && apt-get clean

# install sqlite & mysql
RUN apt-get install -y sqlite sqlite-devel mysql mysql-devel && apt-get clean

# install extension config & software
COPY install.sh /root/

RUN /root/install.sh && rm -f /root/install.sh

# install myemacs for chinese support
COPY myemacs /usr/bin/

CMD ["/bin/bash"]
 

