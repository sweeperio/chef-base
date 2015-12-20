#
# Cookbook Name:: dev
# Recipe:: git
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

git_version  = node["base"]["git"]["version"]
git_checksum = node["base"]["git"]["checksum"]

%w(libcurl4-gnutls-dev libexpat1-dev).each do |prerequisite|
  package prerequisite
end

ark "git" do
  url "https://nodeload.github.com/git/git/tar.gz/v#{git_version}"
  version git_version
  checksum git_checksum
  extension "tar.gz"
  make_opts %w(prefix=/usr/local)
  action :install_with_make
end
