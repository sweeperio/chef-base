# rubocop:disable Style/SingleSpaceBeforeFirstArg
name              "base"
maintainer        "Sweeper Devs"
maintainer_email  "developers@sweeper.io"
license           "mit"
description       "A cookbook that applies for all machines"
long_description  "A cookbook that applies for all machines"
version           "0.2.0"
# rubocop:enable Style/SingleSpaceBeforeFirstArg

supports "ubuntu"

depends "apt"
depends "ark"
depends "build-essential"
depends "chef-client"
depends "runit"
depends "sudo"
depends "user"
