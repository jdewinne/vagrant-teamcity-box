# -*- mode: ruby -*-
# vi: set ft=ruby :

#
# Teamcity
#
# Each component is provisioned via a Puppet manifest in the manifests directory.
#

host_only_network = "192.172.1"

Vagrant::Config.run do |config|

  config.vm.define :teamcity do |teamcity_config|
    teamcity_config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    teamcity_config.vm.box = "precise64"
    teamcity_config.vm.customize [
     "modifyvm", :id,
     "--memory", "4096"
    ]
    teamcity_config.vm.customize ["modifyvm", :id, "--cpus", "2"]
    teamcity_config.vm.customize ["modifyvm", :id, "--ioapic", "on"]
    teamcity_config.vm.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    teamcity_config.vm.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
    
    teamcity_config.vm.network :hostonly, host_only_network + ".10", :adapter => 2

    # Enable the Puppet provisioner
    teamcity_config.vm.provision :puppet do |puppet|
      puppet.manifest_file = "singlevm.pp"
      puppet.module_path = "~/.puppet/modules"
      puppet.manifests_path = "manifests"
    end
  end

end
