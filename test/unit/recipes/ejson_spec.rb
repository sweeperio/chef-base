#
# Cookbook Name:: dev
# Spec:: ejson
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require "spec_helper"

describe "base::ejson" do
  cached(:chef_run) do
    runner = ChefSpec::SoloRunner.new do |node|
      node.set["base"]["ejson"]["add"]    = %w(test_key)
      node.set["base"]["ejson"]["remove"] = %w(dead_key)
    end

    runner.converge(described_recipe)
  end

  it "installs ejson via rubygems" do
    expect(chef_run).to install_gem_package("ejson")
  end

  it "adds each key in the add attribute" do
    expect(chef_run).to add_ejson_key("test_key")
  end

  it "removes each key in the remove attribute" do
    expect(chef_run).to remove_ejson_key("dead_key")
  end
end
