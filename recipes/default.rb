#
# Cookbook Name:: base
# Recipe:: default
#
# Copyright (c) 2015 Sweeper Devs, All Rights Reserved.

include_recipe "apt"

node["base"]["packages"].each { |pkg| package(pkg) }
