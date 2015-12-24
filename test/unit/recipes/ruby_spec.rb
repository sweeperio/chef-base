#
# Cookbook Name:: dev
# Spec:: ruby
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

describe "base::ruby" do
  cached(:chef_run) do
    runner = ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
  end

  it "makes and installs ruby from source" do
    expect(chef_run).to install_with_make_ark("ruby").with(
      url: "http://ftp.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz",
      checksum: "df795f2f99860745a416092a4004b016ccf77e8b82dec956b120f18bdc71edce",
      autoconf_opts: %w(--disable-install-doc)
    )
  end

  it "installs bundler" do
    expect(chef_run).to install_gem_package("bundler")
  end
end
