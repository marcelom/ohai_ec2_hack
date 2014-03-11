name             'ohai_ec2_hack'
maintainer       'Marcelo Moreira'
maintainer_email 'marcelosm@gmail.com'
license          ''
description      'Ohai EC2 plugin Hack'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

recipe "default", "Hack it !!! (makes ec2 detection mandatory)"

%w{redhat centos amazon debian ubuntu}.each do |plat|
 supports plat
end

attribute 'ohai_ec2_hack/enabled',
  :display_name => "Enable Ohai EC2 Hack",
  :description => "Enable Ohai EC2 Hack",
  :default => "true",
  :type => "string",
  :required => "required",
  :recipes => [ "ohai_ec2_hack::default" ]

attribute 'ohai_ec2_hack/hints_dir',
  :display_name => "Ohai Chef Hints directory",
  :description => "Ohai Chef Hints directory",
  :default => "/etc/chef/ohai/hints",
  :type => "string",
  :required => "required",
  :recipes => [ "ohai_ec2_hack::default" ]

attribute 'ohai_ec2_hack/hint_file',
  :display_name => "Ohai Chef Hint file",
  :description => "Ohai Chef Hints file",
  :default => "/etc/chef/ohai/hints/ec2.json",
  :type => "string",
  :required => "required",
  :recipes => [ "ohai_ec2_hack::default" ]
  