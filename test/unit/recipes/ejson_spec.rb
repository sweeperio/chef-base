#
# Cookbook Name:: dev
# Spec:: ejson
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
