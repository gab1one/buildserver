# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Setting the timezone, requires the vagrant-timezone plugin,
  # install it with:  vagrant plugin install vagrant-timezone
  if Vagrant.has_plugin?("vagrant-timezone")
    config.timezone.value = "Europe/Berlin"
  end

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, path: "vagrant-bootstrap.sh"

  config.vm.provider "virtualbox" do |v|
    v.memory = 2048
    v.cpus = 2
  end

  
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, host: 3306, guest: 3306
  config.vm.network :forwarded_port, host: 1337, guest: 9000

  #Debub port:
  #config.vm.network :forwarded_port, host: 6001, guest: 6001
end
