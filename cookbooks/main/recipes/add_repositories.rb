#
# External repositories.
#

# TODO: refactor to a definition
def add_repo(pkg)
    if pkg[:repo] != nil
        if pkg[:repo].match(/^deb/)
            if pkg[:key] != nil
                # download and add key, add repo
                script "add_repository" do
                    interpreter "bash"
                    user "root"
                    cwd "/tmp"
                    code <<-EOS
                    wget -q #{pkg[:key]} -O- | apt-key add -
                    mkdir -p /etc/apt/sources.list.d
                    echo "#{pkg[:repo]}" > /etc/apt/sources.list.d/virtualbox.list
                    EOS
                end
            end
        elsif pkg[:repo].match(/^ppa/)
            # don't care about :key, add repo
            script "add_repository" do
                interpreter "bash"
                user "root"
                cwd "/tmp"
                code "add-apt-repository #{pkg[:repo]}"
            end
        end
    end
end


node[:distro_base_packages].each do |pkg|
    add_repo(pkg)
end
node[:distro_desktop_packages].each do |pkg|
    add_repo(pkg)
end
node[:distro_dev_packages].each do |pkg|
    add_repo(pkg)
end
node[:distro_python_packages].each do |pkg|
    add_repo(pkg)
end
node[:distro_ruby_packages].each do |pkg|
    add_repo(pkg)
end

