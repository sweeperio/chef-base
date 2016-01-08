# rubocop:disable Style/SingleSpaceBeforeFirstArg
name              "base"
maintainer        "sweeper.io"
maintainer_email  "developers@sweeper.io"
license           "mit"
description       "A cookbook that applies for all machines"
long_description  IO.read(File.join(File.dirname(__FILE__), "README.md"))
version           "0.3.1"
# rubocop:enable Style/SingleSpaceBeforeFirstArg

supports "ubuntu"

depends "apt",          "~> 2.0"
depends "chef-client",  "~> 4.0"
depends "core",         "~> 0.0"
depends "git",          "~> 0.1.0"
depends "ruby",         "~> 0.1.0"
depends "runit",        "~> 1.0"
depends "sudo",         "~> 2.0"
depends "user",         "~> 0.0"

chef_version ">= 12.5" if respond_to?(:chef_version)
source_url "https://github.com/sweeperio/chef-base" if respond_to?(:source_url)
issues_url "https://github.com/sweeperio/chef-base/issues" if respond_to?(:issues_url)
