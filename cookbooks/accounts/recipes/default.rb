#
# Cookbook Name:: accounts
# Recipe:: default
#
# Copyright 2013, 1PAC.INC.
#
# All rights reserved - Do Not Redistribute
#

# 1000番台 個人ユーザ、グループ
# 1100番台 アプリユーザ、グループ(ソースでインストールするアプリユーザ含む)
# 2000番台 外部ベンダ等ユーザ、グループ(ソースでインストールするアプリユーザ含む)

unless node["accounts"].nil?
  node["accounts"].each do |account|
    group account["groupname"] do
      gid account["gid"]
    end

    user account["username"] do
      gid account["gid"]
      uid account["uid"]
      password nil
    end

    directory %Q!/home/#{account["username"]}/.ssh! do
      mode 0700
      owner account["username"]
    end

    file %Q!/home/#{account["username"]}/.ssh/authorized_keys! do
      mode 0600
      owner account["username"]
      content account["ssh_pub_key"]
    end
  end
end

