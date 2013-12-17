#
# Cookbook Name:: rbenv
# Recipe:: base_gem
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# gem_packageではユーザが指定できないのでrbenvなrubyにはインストールできない
# gem_package "bundler" do
#   user "app"
#   gem_binary("/home/app/.rbenv/shims/gem")
#   action :install
# end

node["rbenv"]["users"].each do |user|

  node["rbenv"]["base_gems"].each do |gem|
    bash "gem package install #{gem}" do
      user  user["name"]
      group user["group"]
      cwd   user["home"]
      environment "HOME" => user["home"]

      not_if <<-EOC, :user => user["name"], :environment => {"HOME" => user["home"]}
        source $HOME/.bashrc
        gem list | grep #{gem}
      EOC

      code <<-EOC
        source $HOME/.bashrc
        gem install #{gem}
        rbenv rehash
      EOC
    end
  end

end
