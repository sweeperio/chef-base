require "spec_helper"

describe "base::default" do
  APPS     = %w(ag).freeze
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
end
