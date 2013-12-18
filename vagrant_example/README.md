# How To Example

## 1.Initialized Step
1. bundle install
2. modify ssh_config
3. bundle exec knife solo prepare -F ssh_config vg_chef_cookbooks

Initializing completed

## 2.Usual chef-solo step with Berkshelf

* `knife cookbook create COOKBOOK_NAME -o site-cookbooks`
* modify node/**.json
* run `knife solo cook -F ssh_config vg_chef_cookbooks`

