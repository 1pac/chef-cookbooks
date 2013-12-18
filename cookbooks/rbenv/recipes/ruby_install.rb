#
# Cookbook Name:: rbenv
# Recipe:: ruby-install
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node["rbenv"]["users"].each do |user|

  bash "install ruby #{node["rbenv"]["ruby-version"]}" do
    user  user["name"]
    group user["group"]
    cwd   user["home"]
    environment "HOME" => user["home"]

    not_if <<-EOC, :user => user["name"], :environment => {"HOME" => user["home"]}
      source $HOME/.bashrc
      rbenv versions | grep #{node["rbenv"]["ruby-version"]}
    EOC

    # cd $HOME/.rbenv/plugins/ruby-build/ && git pull するタスクを入れるほうがいいな
    code <<-EOC
      source $HOME/.bashrc
      rbenv install #{node["rbenv"]["ruby-version"]}
      rbenv global #{node["rbenv"]["ruby-version"]}
      rbenv rehash
    EOC
  end

end
