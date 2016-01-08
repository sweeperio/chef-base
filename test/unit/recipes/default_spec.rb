#
# Cookbook Name:: base
# Spec:: default
#
# The MIT License (MIT)
#
# Copyright (c) 2015 sweeper.io
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

describe "base::default" do
  INCLUDED_RECIPES = %w(apt build-essential base::git chef-client::runit_service runit sudo user::data_bag)

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
