VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = 'sitesearch'

  config.vm.provider 'virtualbox' do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.network 'forwarded_port', guest: 3000, host: 3000

  config.vm.provision :shell, path: 'puppet/bootstrap.sh'

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet'
    puppet.manifest_file = 'vagrant.pp'  # i.e. puppet/vagrant.pp in project
    puppet.module_path = 'puppet' # i.e. puppet/ in project
    puppet.facter = {
      'fqdn' => 'example.com',
      'fox'  => 'barx'
    }
  end
end
