#
# Cookbook Name:: base-package
# Recipe:: default
#
# Copyright 2013, 1PAC.INC.
#
# All rights reserved - Do Not Redistribute
#

node["base-package"]["packages"].each do |pkg|
  package pkg do
    action :install
  end
end
