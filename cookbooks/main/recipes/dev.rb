#
# Development packages.
#


node[:distro_dev_packages].each do |pkg|
    package pkg[:name] do
        :upgrade
    end
end

#
# Bootstrapping a Python ecosystem
#
node[:distro_python_packages].each do |pkg|
    package pkg[:name] do
        :upgrade
    end
end

# System-wide packages installed by pip.
# Non-system Python stuff should be in a virtualenv.
# TODO: check if package already installed/create a resource
node[:pip_python_packages].each do |pkg|
    execute "install-#{pkg[:name]}" do
        command "sudo pip install -U #{pkg[:name]}"
    end
end

#
# Bootstrapping a ruby ecosystem
#
node[:distro_ruby_packages].each do |pkg|
    package pkg[:name] do
        :upgrade
    end
end

# System-wide packages installed by rubygems.
# TODO: there is a chef resource to install gems, see http://wiki.opscode.com/display/chef/Resources#Resources-Package
node[:gem_ruby_packages].each do |pkg|
    execute "install-#{pkg[:name]}" do
        command "sudo gem install #{pkg[:name]}"
    end
end

