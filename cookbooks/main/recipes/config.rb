#
# Configurations
#

# Blacklist unwanted apps form Ubuntu messaging menu
script "ubuntu_messaging_menu_blacklist_folder" do
    interpreter "bash"
    user node[:user]
    cwd "/tmp"
    code "mkdir -p ~/.config/indicators/messages/applications-blacklist/"
end
node[:banned_apps_messaging_menu].each do |app|
    link_name_path = File.expand_path("~/.config/indicators/messages/applications-blacklist/#{app}")
    # link's permissions are set at 777, is it ok?
    link link_name_path do
        to "/usr/share/indicators/messages/applications/#{app}"
        owner node[:user]
        group node[:group]
    end
end
