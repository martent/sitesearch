#!/usr/bin/env bash
#
# This bootstraps Puppet on Ubuntu
#
set -e

# Silence locale warnings during provisioning
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8

# Load up the release information
. /etc/lsb-release

REPO_DEB_URL="http://apt.puppetlabs.com/puppetlabs-release-${DISTRIB_CODENAME}.deb"

if [ "$(id -u)" != "0" ]; then
  echo "This script must be run as root." >&2
  exit 1
fi

echo "Initial apt-get update ..."
apt-get update >/dev/null

# Install the PuppetLabs repo
echo "Configuring PuppetLabs repo..."
repo_deb_path=$(mktemp)
wget --output-document="${repo_deb_path}" "${REPO_DEB_URL}" 2>/dev/null
dpkg -i "${repo_deb_path}" >/dev/null
apt-get update >/dev/null

# Install Puppet
echo -e "\nNotice: Deprecation warnings from Puppet is expected\n"
echo "Installing Puppet..."
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" install puppet >/dev/null

# Adapt Puppet to it's own requirements ...
touch /etc/puppet/hiera.yaml >/dev/null

echo "Puppet installed!"

echo "Installing Puppet modules ..."
function pupmod {
  puppet module install "$@" >/dev/null
}

# Install all possible modules for simplicity
# Not space and time is required
pupmod attachmentgenie-locales
pupmod jdowning-rbenv
pupmod saz-memcached
pupmod puppetlabs-mysql
pupmod puppetlabs-java
pupmod puppetlabs-apt
pupmod elasticsearch-elasticsearch
pupmod rodjek-logrotate
pupmod puppetlabs-apache
pupmod jfryman-nginx
pupmod puppetlabs-ntp
