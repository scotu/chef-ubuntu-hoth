#! /bin/bash

sudo apt-get -q -y install git
git clone https://scotu@github.com/scotu/chef-ubuntu-hoth.git /tmp/chef-ubuntu-hoth
sudo apt-get -q -y install ruby1.8 ruby1.8-dev ri1.8 libruby1.8 rubygems1.8 build-essential wget ssl-cert
sudo gem install chef
sudo /var/lib/gems/1.8/bin/chef-solo -c /tmp/chef-ubuntu-hoth/solo.rb
