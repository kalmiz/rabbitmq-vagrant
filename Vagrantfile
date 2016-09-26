# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "CentOS-6"
  config.vm.box_url = "https://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.5-x86_64-v20140504.box"
  #config.vm.network :private_network, ip: "192.168.56.47"
  config.vm.network :forwarded_port, guest: 5672, host: 5672
  config.vm.network :forwarded_port, guest: 15672, host: 15672

  config.ssh.insert_key = false

  config.vm.provider "virtualbox" do |v|
    v.name = "rabbitmq-server"
    v.memory = 512
  end

  config.vm.provision :shell, :path => "bootstrap.sh"

end
