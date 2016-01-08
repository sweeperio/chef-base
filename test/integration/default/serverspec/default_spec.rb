require "spec_helper"

describe "base::default" do
  APPS     = %w(ag chef-client git runsv sv).freeze
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

  context "git" do
    describe command("git version") do
      its(:stdout) { should contain("git version 2.7.0") }
    end
  end
end
