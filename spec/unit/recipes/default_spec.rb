#
# Cookbook Name:: base
# Spec:: default
#
# Copyright (c) 2015 Sweeper Devs, All Rights Reserved.

require "spec_helper"

describe "base::default" do
  INCLUDED_RECIPES = %w(apt build-essential base::git runit)

  cached(:chef_run) do
    runner = ChefSpec::ServerRunner.new do |node|
      node.set["base"]["packages"] = %w(curl)
    end

    runner.converge(described_recipe)
  end

  it "includes expected recipes" do
    INCLUDED_RECIPES.each do |recipe|
      expect(chef_run).to include_recipe(recipe)
    end
  end

  it "installs packages specified in the attribute" do
    expect(chef_run).to install_package("curl")
  end
end
