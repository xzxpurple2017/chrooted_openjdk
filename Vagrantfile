# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "centos/6"
  config.vm.box_check_update = true
  config.vm.hostname = "centos6-vm2"
  config.vm.network "private_network", type: "dhcp", nic_type: "virtio"
  config.vm.synced_folder ".", "/vagrant", disabled: false
  config.ssh.forward_agent = true
  config.vm.provider :virtualbox do |vb|
    vb.memory = 1024
    vb.cpus = 1
    vb.name = "centos6-vm2"
  end

  config.vm.provision :shell, path: "scripts/mounting.sh", :privileged => true
  config.ssh.username = "vagrant"
  config.ssh.insert_key = true

  config.vm.provision "shell", inline: "groupadd hackers ; usermod -g hackers vagrant", :privileged => true

end

# vim: set fileformat=unix
