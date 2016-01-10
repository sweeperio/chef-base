# rubocop:disable Style/SingleSpaceBeforeFirstArg
name              "swpr_base"
maintainer        "sweeper.io"
maintainer_email  "developers@sweeper.io"
license           "mit"
description       "A cookbook that applies for all machines"
long_description  IO.read(File.join(File.dirname(__FILE__), "README.md"))
version           "0.1.0"
# rubocop:enable Style/SingleSpaceBeforeFirstArg

supports "ubuntu"

depends "apt",          "~> 2.0"
depends "chef-client",  "~> 4.0"
depends "runit",        "~> 1.0"
depends "sudo",         "~> 2.0"
depends "swpr_core",    "~> 0.0"
depends "swpr_git",     "~> 0.0"
depends "swpr_ruby",    "~> 0.0"
depends "user",         "~> 0.0"

chef_version ">= 12.5" if respond_to?(:chef_version)
source_url "https://github.com/sweeperio/chef-swpr_base" if respond_to?(:source_url)
issues_url "https://github.com/sweeperio/chef-swpr_base/issues" if respond_to?(:issues_url)
