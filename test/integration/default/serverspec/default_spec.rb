require "spec_helper"

describe "base::default" do
  APPS = %w(ag)

  APPS.each do |app|
    describe command("which #{app}") do
      its(:stdout) { should_not eq("") }
    end
  end
end
