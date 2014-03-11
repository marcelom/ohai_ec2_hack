# Should we apply the hack or no ? Default is yes
node.default[:ohai_ec2_hack][:enabled] = true

# The location of the hints folder and the hint file
node.default[:ohai_ec2_hack][:hints_dir] = "/etc/chef/ohai/hints"
node.default[:ohai_ec2_hack][:hint_file] = "#{node[:ohai_ec2_hack][:hints_dir]}/ec2.json"
