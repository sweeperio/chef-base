#
# Cookbook Name:: base
# Recipe:: ruby
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

ark "ruby" do
  url node["base"]["ruby"]["source"]
  checksum node["base"]["ruby"]["checksum"]
  autoconf_opts %w(--disable-install-doc)
  action :install_with_make
end

gem_package "bundler"
