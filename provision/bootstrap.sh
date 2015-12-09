#!/bin/bash

echo "Provisioning virtual machine..."
    add-apt-repository ppa:ubuntu-toolchain-r/test
    apt-get update

echo "Installing Git"
apt-get install git -y

echo "Installing MySQL"
apt-get install debconf-utils -y

debconf-set-selections <<< "mysql-server mysql-server/root_password password 1234"

debconf-set-selections <<< "mysql-server mysql-server/root_password_again password 1234"

apt-get install mysql-server-5.6 -y

apt-get install libmysqlclient-dev -y

echo "installing other dependencies"

apt-get install -y \
	python-dev \
	build-essential \
	python \
    git-core \
    cmake \
    zlib1g-dev \
    bzip2 \
    libyaml-dev \
    libyaml-0-2

    apt-get install gcc-4.8 g++-4.8
    update-alternatives --remove-all gcc 
    update-alternatives --remove-all g++
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 20
    update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.8 20
    update-alternatives --config gcc
    update-alternatives --config g++

echo "export CC=gcc" >> /home/vagrant/.profile
echo "export CXX=g++" >> /home/vagrant/.profile

source /home/vagrant/.profile

echo "Downloading pip and setuptools"
wget https://bootstrap.pypa.io/get-pip.py 
wget https://bootstrap.pypa.io/ez_setup.py


wget https://capnproto.org/capnproto-c++-0.5.2.tar.gz && \
    tar zxf capnproto-c++-0.5.2.tar.gz && \
    cd capnproto-c++-0.5.2 && \
    ./configure && \
    make check && \
    make install

echo "Cloning git repositories"
cd /home/vagrant && git clone https://github.com/numenta/nupic.git
cd /home/vagrant && git clone https://github.com/rhyolight/nupic.examples.git

sudo chown -R vagrant /home/vagrant/nupic
sudo chown -R vagrant /home/vagrant/nupic.examples