#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright (c) 2015 Sweeper Devs, All Rights Reserved.

include_recipe "apt"
include_recipe "build-essential"
include_recipe "base::git"
include_recipe "base::ruby"
include_recipe "base::ejson"
include_recipe "chef-client"
include_recipe "runit"
include_recipe "sudo"
include_recipe "user::data_bag"

node["base"]["packages"].each { |pkg| package(pkg) }

group "sudoers"
