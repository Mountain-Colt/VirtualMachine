#!/usr/bin/env bash

echo Updating...
sudo apt-get update
sudo apt-get install -y apache2
#download mesos
echo Downloading Mesos 0.20.1
wget http://www.apache.org/dist/mesos/0.20.1/mesos-0.20.1.tar.gz
tar -zxf mesos-0.20.1.tar.gz

echo Updating...
sudo apt-get update
sudo apt-get install -y apache2
sudo apt-get install docker.io

echo Installing dependencies
# install mesos dependencies
sudo apt-get install build-essential -y
sudo apt-get install openjdk-6-jdk -y
sudo apt-get install python-dev python-boto -y
sudo apt-get install libcurl4-nss-dev -y
sudo apt-get install libsasl2-dev -y
sudo apt-get install maven -y
sudo apt-get install libapr1-dev -y
sudo apt-get install libsvn-dev -y

echo Installing Mesos 0.20.1
# install mesos
cd mesos-0.20.1/
sudo mkdir build
cd build/
sudo ../configure
sudo make
sudo make check
sudo make install

echo Mesos installation complete
# connect to master
# sudo ./bin/mesos-slave.sh --master=168.61.210.76:5050
# sudo mesos-slave --master=168.61.210.76:5050

# # other ?????
# rm -rf /var/www
# ln -fs /vagrant /var/www
