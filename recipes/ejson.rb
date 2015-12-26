#
# Cookbook Name:: base
# Recipe:: ejson
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

gem_package "ejson"

keys_to_add    = node.attr!("base", "ejson", "add")
keys_to_remove = node.attr!("base", "ejson", "remove")

keys_to_add.each do |key|
  ejson_key key
end

keys_to_remove.each do |key|
  ejson_key key do
    action :remove
  end
end
