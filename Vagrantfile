# -*- mode: ruby -*-
# vi: set ft=ruby :

#IP used for hostonly interface
ip = "192.168.0.100"
puts "Hostonly IP #{ip}"

Vagrant.configure("2") do |config|
    config.vagrant.host = :detect

    config.vm.guest = :ubuntu
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    config.vm.hostname = "projects.dev"

    config.vm.network :private_network, ip: ip
    #, :adpater => 2

    config.ssh.forward_agent = true
    config.ssh.forward_x11 = false
    config.ssh.guest_port = 22    
    config.ssh.max_tries = 100
    config.ssh.timeout = 30

    config.vm.provider :virtualbox do |v|
        v.customize ["modifyvm", :id, "--ostype", "Ubuntu_64"]
        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--cpus", 2]
        v.customize ["modifyvm", :id, "--rtcuseutc", "on"] #see: https://github.com/mitchellh/vagrant/issues/391#issuecomment-5834770
        v.customize ["modifyvm", :id, "--cpuhotplug", "on"]
        v.customize ["modifyvm", :id, "--ioapic", "on"]
    end

    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.module_path = "puppet/modules"
        puppet.manifest_file = "site.pp"
        puppet.options = ['--summarize']
    end
end