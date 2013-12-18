#
# Cookbook Name:: rbenv
# Recipe:: install
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# reference) https://github.com/fesplugas/rbenv-installer
cookbook_file "/usr/local/src/rbenv-installer.sh" do
  source "rbenv-installer.sh"
  mode 0655
end

# Requirement package
%w(git curl).each do |pkg|
  package "requirement package #{pkg}" do
    package_name pkg
    action :install
  end
end

node["rbenv"]["users"].each do |user|

  bash "install rbenv" do
    user  user["name"]
    group user["group"]
    cwd   user["home"]
    environment "HOME" => user["home"]
    creates "#{user["home"]}/.rbenv"

    code <<-EOC
    bash /usr/local/src/rbenv-installer.sh

    echo 'export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi'  >> $HOME/.bashrc
    EOC
  end

end
