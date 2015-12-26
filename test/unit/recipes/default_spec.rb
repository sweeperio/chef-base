#
# Cookbook Name:: base
# Spec:: default
#
# Copyright (c) 2015 Sweeper Devs, All Rights Reserved.

describe "base::default" do
  INCLUDED_RECIPES = %w(apt build-essential base::ejson base::git base::ruby chef-client runit sudo user::data_bag)

  before do
    stub_command("which sudo")
  end

  cached(:chef_run) do
    runner = ChefSpec::SoloRunner.new do |node|
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

  context "when users are specified" do
    before do
      user_stub = {
        id: "test_user",
        comment: "A test user account",
        home: "/home/test_user",
        groups: %w(valid_accounts)
      }

      stub_data_bag_item(:users, "test_user").and_return(user_stub)
    end

    cached(:chef_run) do
      runner = ChefSpec::SoloRunner.new do |node|
        node.set["users"] = %w(test_user)
      end

      runner.converge(described_recipe)
    end

    it "adds the user" do
      expect(chef_run).to create_user_account("test_user")
    end
  end
end
