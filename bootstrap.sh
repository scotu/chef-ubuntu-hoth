#! /bin/bash

sudo apt-get install git
git clone https://scotu@github.com/scotu/chef-ubuntu-hoth.git /tmp/chef-ubuntu-hoth
sudo apt-get install ruby1.8 ruby1.8-dev ri1.8 libruby1.8 rubygems1.8 build-essential wget ssl-cert
sudo gem install chef
/var/lib/gems/1.8/bin/chef-solo -c /tmp/chef-ubuntu-hoth/solo.rb
