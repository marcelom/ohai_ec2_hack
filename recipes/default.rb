#
# Author::      Marcelo Moreira (<marcelosm@gmail.com>)
# Recipe::      ohai_ec2_hack::default
#

ohai "reload_ec2" do
  action :nothing
  plugin "ec2"
end

ruby_block "dump_ec2_metadata_before hack" do
  block do
    Chef::Log.debug("node[:ec2] = '#{node[:ec2]}'")
  end
end

directory node[:ohai_ec2_hack][:hints_dir] do
  not_if node.default[:ohai_ec2_hack][:enabled] == false
  owner "root"
  group "root"
  mode 00755
  recursive true
  action :create
end

file node[:ohai_ec2_hack][:hint_file] do
  not_if node.default[:ohai_ec2_hack][:enabled] == false
  #action :create_if_missing
  content ""
  mode 00644
  owner 'root'
  group 'root'
  notifies :reload, "ohai[reload_ec2]", :immediately
end

ruby_block "dump_ec2_metadata_after_hack" do
  block do
    Chef::Log.debug("node[:ec2] = '#{node[:ec2]}'")
  end
end
