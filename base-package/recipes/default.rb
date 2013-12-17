#
# Cookbook Name:: base-package
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node["base-package"]["packages"].each do |pkg|
  package pkg do
    action :install
  end
end
