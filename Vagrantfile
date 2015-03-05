VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = 'sitesearch'

  config.vm.provider 'virtualbox' do |v|
    v.memory = 4096
    v.cpus = 4
  end

  config.vm.network 'forwarded_port', guest: 3000, host: 3030

  config.vm.provision :shell, path: 'puppet/bootstrap.sh'

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet'
    puppet.manifest_file = 'vagrant.pp'
    puppet.module_path = 'puppet'
    puppet.facter = {
      'fqdn' => 'example.com'
    }
  end
end
