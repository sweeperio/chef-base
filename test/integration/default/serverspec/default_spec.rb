require "spec_helper"

describe "base::default" do
  APPS     = %w(ag chef-client git ruby runsv sv).freeze
  PACKAGES = %w(autoconf build-essential).freeze

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
      its(:stdout) { should contain("git version 2.6.4") }
    end
  end

  context "ruby" do
    describe command("ruby -v") do
      its(:stdout) { should contain("2.2.3") }
    end
  end
end
