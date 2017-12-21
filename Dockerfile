FROM centos:6
MAINTAINER Linjiang Li "lilinj2000@gmail.com"
ENV REFRESHED_AT 2017-12-21

# remove the tsflags on yum.conf
RUN sed -i 's/tsflags/# tsflags/g' /etc/yum.conf

RUN curl -o /etc/yum.repos.d/devtools-2.repo -L http://people.centos.org/tru/devtools-2/devtools-2.repo 

# install packages
RUN yum install -y \
      man man-pages \
      devtoolset-2-gcc devtoolset-2-gcc-c++ devtoolset-2-binutils \
      make autoconf automake libtool cmake \
      gdb \
      openssl openssl-devel.x86_64 \
      emacs \
      which net-tools wget unzip file \
      git subversion \
      perl-Digest-MD5.x86_64 \
      valgrind \
      sqlite sqlite-devel \
      mysql mysql-devel \
      java-1.8.0-openjdk.x86_64 \
      zlib-devel bzip2-devel \
      ncurses-devel

ENV PATH "/opt/rh/devtoolset-2/root/usr/bin:$PATH"

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

# upgrade python
RUN wget https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tgz; sync; \
    tar xvf Python-2.7.14.tgz; sync; \
    cd Python-2.7.14; sync; \
    ./configure; sync; \
    make install; sync; \
    cd ..; sync; \
    rm -rf Python-2.7.14 Python-2.7.14.tgz

RUN wget https://pypi.python.org/packages/69/56/f0f52281b5175e3d9ca8623dadbc3b684e66350ea9e0006736194b265e99/setuptools-38.2.4.zip#md5=e8e05d4f8162c9341e1089c80f742f64; sync; \
    unzip setuptools-38.2.4.zip; sync; \
    cd setuptools-38.2.4; sync; \
    python setup.py install; sync; \
    cd ..; sync; \
    rm -rf setuptools-38.2.4 setuptools-38.2.4.zip

RUN easy_install pip virtualenv

# install argparse, cpplint, cppclean
RUN pip install argparse cpplint cppclean

# install jenkins
ENV JENKINS_HOME /opt/jenkins/data
RUN mkdir -p $JENKINS_HOME && curl -o /opt/jenkins/jenkins.war -L mirrors.jenkins.io/war-stable/latest/jenkins.war

# clean cached data
RUN yum clean all

# install myemacs for chinese support
COPY myemacs /usr/bin/
RUN chmod 755 /usr/bin/myemacs

ENV TZ "Asia/Shanghai"

CMD ["/bin/bash"]
