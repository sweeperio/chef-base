require "spec_helper"

describe "base::default" do
  APPS     = %w(ag chef-client git ruby runsv sv).freeze
  PACKAGES = %w(silversearcher-ag).freeze

  APPS.each do |app|
    describe command("which #{app}") do
      its(:stdout) { should_not eq("") }
    end
  end

  PACKAGES.each do |pkg|
    describe package(pkg) do
      it { should be_installed }
    end
  end

  context "sudo" do
    describe group("sudoers") do
      it { should exist }
    end

    describe file("/etc/sudoers") do
      it { should exist }
      it { should be_file }

      its(:content) { should contain(Regexp.escape("%sudoers ALL=(ALL) NOPASSWD:ALL")) }
    end
  end

  context "users from data bags" do
    describe group("test") do
      it { should exist }
    end

    describe group("some_group") do
      it { should exist }
    end

    describe user("test") do
      it { should exist }
      it { should belong_to_group("test") }
      it { should belong_to_group("some_group") }
    end
  end

  context "chef-client" do
    describe service("chef-client") do
      it { should be_running }
    end
  end

  context "git" do
    describe command("git version") do
      its(:stdout) { should contain("git version 2.7.0") }
    end
  end

  context "ruby" do
    describe command("ruby -v") do
      its(:exit_status) { should eq(0) }
      its(:stdout) { should contain("ruby 2.2.3") }
    end
  end
end
