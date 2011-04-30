#
# Basic packages.
#


node[:distro_base_packages].each do |pkg|
    package pkg[:name] do
        :upgrade
    end
end

