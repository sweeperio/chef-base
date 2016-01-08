# base

[![Build Status](https://travis-ci.org/sweeperio/chef-base.svg?branch=master)](https://travis-ci.org/sweeperio/chef-base)

A cookbook for all machines. This should be put at the top of the run list for almost all machines.

## What This Does

* Sets up apt 
* Installs packages defined in `node["base"]["packages"]` (see attributes)
* Installs [runit]
* Installs git (via [chef-git])
* Configures chef-client to run periodically
* Creates a sudoers group and grants passwordless sudo access to it
* Installs a system ruby (via [chef-ruby])
* Adds users/groups from data bag (via [user cookbook])

[runit]: http://smarden.org/runit/
[chef-git]: https://github.com/sweeperio/chef-git
[chef-ruby]: https://github.com/sweeperio/chef-ruby
[user cookbook]: https://github.com/fnichol/chef-user

## Attributes

|Attribute|Description|Default|
|---------|-----------|-------|
|`node["base"]["packages"]` | An array of apt packages to be installed | `curl`<br>`zlib1g-dev`<br>`libssl-dev`<br>`libreadline-dev`<br>`libyaml-dev`<br>`libcurl4-openssl-dev`<br>`libffi-dev` |


### Default Sudo Settings

See [sudo cookbook] for options.

Attribute|Description|Default
---------|-----------|-------
`node["authorization"]["sudo"]["groups"]` | Groups to enable sudo access for | `%w(sudoers)`
`node["authorization"]["sudo"]["passwordless"]` | Whether or not to require passwords for sudo | `true`

[sudo cookbook]: https://github.com/chef-cookbooks/sudo
