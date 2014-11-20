# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"
    # Setting memory and CPU
  config.vm.provider "virtualbox" do |vb|
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, '--cpus',   "2"]
  end
  # old master flag:  --master=168.61.210.76:5050"
  # config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.provision :shell, path: "test.sh", args: ENV['SHELL_ARGS']
  # config.vm.provision :shell, inline: "sudo /home/vagrant/mesos-0.20.0/build/bin/mesos-slave.sh --master=splinter2.cloudapp.net"
end
