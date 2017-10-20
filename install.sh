#! /bin/sh

# git config
# echo "
# [user]
#         name = lilinj2000
#         email = lilinj2000@gmail.com
# [push]
#         default = simple

# [color]
# 	ui = auto
# " > ~/.gitconfig

# upgrade gcc & g++
wget http://people.centos.org/tru/devtools-2/devtools-2.repo -O /etc/yum.repos.d/devtools-2.repo

yum install -y devtoolset-2-gcc devtoolset-2-gcc-c++ devtoolset-2-binutils

sed -i 's/PATH=/PATH=\/opt\/rh\/devtoolset-2\/root\/usr\/bin:/g' /root/.bash_profile

export PATH=/opt/rh/devtoolset-2/root/usr/bin:$PATH

# cp styleguide-gh-pages/google-c-style.el ~/.emacs.d

# emacs config
# echo """
# (add-to-list 'load-path (expand-file-name \"~/.emacs.d\"))  
# (require 'google-c-style)  
# (add-hook 'c-mode-common-hook 'google-set-c-style)  
# (add-hook 'c-mode-common-hook 'google-make-newline-indent)
# """ > ~/.emacs

# install cppcheck
wget https://github.com/lilinj2000/cppcheck/archive/master.zip && unzip master.zip

cd cppcheck-master

make install CFGDIR=/usr/bin/cfg

cd .. && rm -rf cppcheck-master master.zip

# install lcov
wget https://github.com/lilinj2000/lcov/archive/master.zip && unzip master.zip

cd lcov-master

make install

cd .. && rm -rf lcov-master master.zip

# install daemonize
wget https://github.com/lilinj2000/daemonize/archive/master.zip && unzip master.zip

cd daemonize-master

./configure && make && make install

cd .. && rm -rf daemonize-master master.zip


