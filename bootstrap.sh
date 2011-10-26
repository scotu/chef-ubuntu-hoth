#! /bin/bash

COM_POWAZORD_CHEF_UBUNTU_HOTH_USAGE_MSG="Usage : $0 <distro-version>"
COM_POWAZORD_CHEF_UBUNTU_HOTH_DISTRO_VERSIONS_MSG="You can use 11.10, oneiric, 11.04 or natty as <distro-version>"

COM_POWAZORD_CHEF_UBUNTU_HOTH_CLONE_DIR=/tmp/chef-ubuntu-hoth


if [ $# -lt 1 ]
then
	echo $COM_POWAZORD_CHEF_UBUNTU_HOTH_USAGE_MSG
	echo $COM_POWAZORD_CHEF_UBUNTU_HOTH_DISTRO_VERSIONS_MSG
	exit
fi
case "${1}" in
	"11.10" | "oneiric" | "11.10-oneiric")
		COM_POWAZORD_CHEF_UBUNTU_HOTH_BRANCH="11.10-oneiric"
		;;
	"11.04" | "natty" | "11.04-natty")
		COM_POWAZORD_CHEF_UBUNTU_HOTH_BRANCH="11.04-natty"
		;;
	*)
		echo "Distro version not recognized."
		echo
		echo $COM_POWAZORD_CHEF_UBUNTU_HOTH_USAGE_MSG
		echo $COM_POWAZORD_CHEF_UBUNTU_HOTH_DISTRO_VERSIONS_MSG
           	exit
           	;;
esac

sudo apt-get -q -y install git ruby1.9.1 ruby1.9.1-dev ri1.9.1 libruby1.9.1 rubygems1.9.1 build-essential wget ssl-cert
(git clone https://scotu@github.com/scotu/chef-ubuntu-hoth.git $COM_POWAZORD_CHEF_UBUNTU_HOTH_CLONE_DIR && cd$COM_POWAZORD_CHEF_UBUNTU_HOTH_CLONE_DIR && git checkout -b $COM_POWAZORD_CHEF_UBUNTU_HOTH_BRANCH origin/$COM_POWAZORD_CHEF_UBUNTU_HOTH_BRANCH)

sudo gem install chef
sudo /var/lib/gems/1.9.1/bin/chef-solo -c $COM_POWAZORD_CHEF_UBUNTU_HOTH_CLONE_DIR/solo.rb && rm -rf $COM_POWAZORD_CHEF_UBUNTU_HOTH_CLONE_DIR
