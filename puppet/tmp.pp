# cd /vagrant
# sudo puppet apply --modulepath /etc/puppet/modules:/vagrant/puppet puppet/server.pp

# $value = template("my_module/mytemplate.erb")

$roo = 'doo'
include malmo::user
