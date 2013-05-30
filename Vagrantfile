# -*- mode: ruby -*-
# vi: set ft=ruby :

#IP used for hostonly interface
ip = "192.168.0.100"
puts "Hostonly IP #{ip}"

def shared_workspace
    share_file_name = '.shared_folder'
    share_file_name = File.join(File.dirname(__FILE__), share_file_name)

    unless File.exists?(share_file_name)
        puts "ERROR: please set up a '#{share_file_name}' file containing the path to your images folder"
        exit
    end

    shared_workspace_path = File.read(share_file_name).strip
    puts "Mounting images from: #{shared_workspace_path}"

   return shared_workspace_path
end

Vagrant::Config.run do |config|
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    config.vm.host_name = "projects.dev"
    
    config.vm.network :hostonly, ip, :adpater => 2
    config.ssh.forward_agent = true
    config.ssh.max_tries = 10 #faster feedback if eth0 hangs
    
    config.vm.provider :virtualbox do |v|
#        v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
        v.customize ["modifyvm", :id, "--memory", 1024]
        v.customize ["modifyvm", :id, "--cpus", 2]
        v.customize ["modifyvm", :id, "--rtcuseutc", "on"] #see: https://github.com/mitchellh/vagrant/issues/391#issuecomment-5834770
        v.customize ["modifyvm", :id, "--cpuhotplug", "on"]
        v.customize ["modifyvm", :id, "--ioapic", "on"]
    end
    
    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.module_path = "puppet/modules"
        puppet.options = ['--summarize']
    end
end
