FROM centos:7
LABEL maintainer="lilinj2000@gmail.com"
ENV REFRESHED_AT 2018-05-25

# remove the tsflags on yum.conf
RUN sed -i 's/tsflags/# tsflags/g' /etc/yum.conf

# install man pages
RUN yum install -y man-db man-pages \
        gcc gcc-c++ \
        make autoconf automake libtool \
        gdb \
        openssl openssl-devel \
        python-setuptools \
        python-devel \
        which net-tools wget unzip file \
        git subversion \
        valgrind \
        sqlite sqlite-devel mysql mysql-devel \
        kernel-devel \
        epel-release.noarch \
        flex bison \
        libuuid-devel

RUN yum install -y python-pip dkms

RUN pip install virtualenv dpkt cpplint

# clean cached data
RUN yum clean all

# install cmake
RUN wget https://github.com/lilinj2000/CMake/archive/master.zip; sync; \
    unzip master.zip; sync; \
    cd CMake-master; sync; \
    ./bootstrap; sync; \
    make install; sync; \
    cd ..; sync; \
    rm -rf CMake-master master.zip

# install cppcheck
RUN wget https://github.com/lilinj2000/cppcheck/archive/master.zip; sync; \
    unzip master.zip; sync; \
    cd cppcheck-master; sync; \
    make install CFGDIR=/usr/bin/cfg; sync; \
    cd ..; sync; \
    rm -rf cppcheck-master master.zip

# install lcov
RUN wget https://github.com/lilinj2000/lcov/archive/master.zip; sync; \
    unzip master.zip; sync; \
    cd lcov-master; sync; \
    make install; sync; \
    cd ..; sync; \
    rm -rf lcov-master master.zip

# install daemonize
RUN wget https://github.com/lilinj2000/daemonize/archive/master.zip; sync; \
    unzip master.zip; sync; \
    cd daemonize-master; sync; \
    ./configure; sync; \
    make install; sync; \
    cd ..; sync; \
    rm -rf daemonize-master master.zip

ENV TZ "Asia/Shanghai"

CMD ["/bin/bash"]
