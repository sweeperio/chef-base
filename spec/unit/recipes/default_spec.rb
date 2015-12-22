#
# Cookbook Name:: base
# Spec:: default
#
# Copyright (c) 2015 Sweeper Devs, All Rights Reserved.

require "spec_helper"

describe "base::default" do
  INCLUDED_RECIPES = %w(apt build-essential base::git base::ruby chef-client runit sudo)

  cached(:chef_run) do
    stub_command("which sudo")

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

  it "creates sudoers group" do
    expect(chef_run).to create_group("sudoers")
  end

  it "grants passwordless sudo for sudoers group" do
    expect(chef_run).to render_file("/etc/sudoers").with_content("%sudoers ALL=(ALL) NOPASSWD:ALL")
  end
end
