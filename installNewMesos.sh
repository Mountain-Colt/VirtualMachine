#!/bin/bash
#This is a script to download dependencies,
#and configure installation of Mesos
#on Ubuntu system

#some steps taken as recomended by Mesos getting started document

#By Ralph Samuel
#11/11/2014



# Ensure apt-get is up to date.
echo "*****************Installing Updates"
apt-get --assume-yes update


echo "*****************Installing Tools and Libraries"
 # Install build tools.
apt-get --assume-yes install build-essential

 # Install OpenJDK java.
apt-get --assume-yes install openjdk-6-jdk

 # Install devel python.
apt-get --assume-yes install python-dev python-boto

 # Install devel libcurl
apt-get --assume-yes install libcurl4-nss-dev

 # Install devel libsasl (***Only required for Mesos 0.14.0 or newer***).
apt-get --assume-yes install libsasl2-dev

 # Install Maven (***Only required for Mesos 0.18.1 or newer***).
apt-get --assume-yes install maven

 # Install devel libapr1 (***Only required for Mesos 0.21.0 or newer***)
apt-get --assume-yes install libapr1-dev

 # Install devel libsvn (***Only required for Mesos 0.21.0 or newer***)
apt-get --assume-yes install libsvn-dev

# Install dh-autoreconf --needed for bootstrap 
sudo apt-get --assume-yes install dh-autoreconf

#install git
sudo apt-get --assume-yes install git

#prepare directory
mkdir Mesos
cd Mesos

echo "*****************Downloading Mesoss"

#download mesos
git clone https://github.com/philosoralphter/mesos.git
cd mesos

#bootstrap git repo
sudo ./bootstrap

#make build directory and change cwd
mkdir build
cd build

#configure make
echo "*****************Configuring Mesos Install"
../configure > CONFIG_LOG.log 2>&1

#Run make
make > MAKE_LOG.log 2>&1

#Run make Check
make check > MAKE_CHECK_LOG.log 2>&1

#Add mesos library to library path
sudo echo "import /usr/local/lib" >> /etc/ld.so.conf

echo "ready to install!!!"
