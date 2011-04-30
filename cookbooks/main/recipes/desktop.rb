#
# Desktop packages.
#


node[:distro_desktop_packages].each do |pkg|
    package pkg[:name] do
        :upgrade
    end
end

