# rubocop:disable Style/SingleSpaceBeforeFirstArg
name              "base"
maintainer        "Sweeper Devs"
maintainer_email  "developers@sweeper.io"
license           "mit"
description       "A cookbook that applies for all machines"
long_description  "A cookbook that applies for all machines"
version           "0.3.0"
# rubocop:enable Style/SingleSpaceBeforeFirstArg

supports "ubuntu"

depends "apt", "~> 2.0"
depends "ark", "~> 0.0"
depends "build-essential", "~> 2.0"
depends "chef-client", "~> 4.0"
depends "core", "~> 0.0"
depends "runit", "~> 1.0"
depends "sudo", "~> 2.0"
depends "user", "~> 0.0"
