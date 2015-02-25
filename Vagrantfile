VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.hostname = 'sitesearch'

  config.vm.provider 'virtualbox' do |v|
    v.memory = 2048
    v.cpus = 2
  end

  config.vm.network 'forwarded_port', guest: 3000, host: 3000

  config.vm.provision :shell,
    inline: 'locale-gen sv_SE.UTF-8 && update-locale LANG=en_US.UTF-8 LANGUAGE=en_US.UTF-8 LC_ALL=en_US.UTF-8'

  config.vm.provision :shell,
    path: 'vagrant_provision.sh',
    keep_color: true

  config.vm.provision :shell,
    privileged: false,
    path: 'vagrant_ruby_provision.sh',
    keep_color: true
end
