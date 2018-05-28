FROM centos:7
LABEL maintainer="lilinj2000@gmail.com"
ENV REFRESHED_AT 2018-05-25

# remove the tsflags on yum.conf
RUN sed -i 's/tsflags/# tsflags/g' /etc/yum.conf

# install man pages
RUN yum install -y man-db man-pages \
        gcc gcc-c++ \
        make autoconf automake libtool \
        cmake \
        gdb \
        openssl openssl-devel.x86_64 \
        python-setuptools && easy_install pip virtualenv \
        which net-tools wget unzip file \
        git subversion \
        valgrind \
        sqlite sqlite-devel mysql mysql-devel \
        kernel-devel

# clean cached data
RUN yum clean all

ENV TZ "Asia/Shanghai"

CMD ["/bin/bash"]
