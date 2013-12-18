j
# Cookbook Name:: sudo
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node["users"].each do |user|

  template "create sudoers for #{user}" do
    path "/etc/sudoers.d/#{user}"
    source "sudoers.erb"
    variables(:user => user)
    owner "root"
    group "root"
    mode 0440
  end

end
