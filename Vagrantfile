VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'bento/ubuntu-16.04'
  config.vm.hostname = 'www.local.malmo.se'

  config.vm.provider :virtualbox do |v|
    v.memory = 1024 * 2
    v.cpus = 2
  end
  config.vm.provider :vmware_fusion
  config.vm.provider :vmware_workstation

  config.vm.network 'forwarded_port', guest: 3000, host: 3030

  config.vm.provision :shell, path: 'https://raw.githubusercontent.com/malmostad/puppet-mcommons/master/bootstrap.sh'

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet'
    puppet.manifest_file = 'vagrant.pp'
    puppet.module_path = 'puppet'
    puppet.facter = {
      'fqdn' => 'www.local.malmo.se'
    }
  end
end
