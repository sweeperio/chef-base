#
# Cookbook Name:: dev
# Spec:: ruby
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

describe "base::ruby" do
  cached(:chef_run) do
    runner = ChefSpec::SoloRunner.new
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
