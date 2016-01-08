# base

[![Build Status](https://travis-ci.org/sweeperio/chef-base.svg?branch=master)](https://travis-ci.org/sweeperio/chef-base)

A cookbook for all machines. This should be put at the top of the run list for almost all machines.

## What This Does

* Sets up apt cookbook
* Installs packages defined in `node["base"]["packages"]` (see attributes)
* Installs [runit]
* Installs git
* Configures chef-client to run periodically (see attributes)
* Creates a sudoers group and grants passwordless sudo access to it
* Installs a system ruby (see attributes)

[runit]: http://smarden.org/runit/

## Attributes

Attribute|Description|Default
---------|-----------|-------
`node["base"]["packages"]` | An array of apt packages to be installed | `curl`<br>`zlib1g-dev`<br>`libssl-dev`<br>`libreadline-dev`<br>`libyaml-dev`<br>`libcurl4-openssl-dev`<br>`libffi-dev`


### Chef-Client Attributes

These are using [the defaults], but the two below really should/must be set.

Attribute|Description|Default
---------|-----------|-------
`node["chef_client"]["server_url"]` | The URL for your chef server | `http://localhost:4000`
`node["chef_client"]["validation_client_name"]` | The validator name | `chef-validator`

[defaults]: https://github.com/cookbooks/chef-client

### Default Sudo Settings

See [sudo cookbook] for options.

Attribute|Description|Default
---------|-----------|-------
`node["authorization"]["sudo"]["groups"]` | Groups to enable sudo access for | `%w(sudoers)`
`node["authorization"]["sudo"]["passwordless"]` | Whether or not to require passwords for sudo | `true`

[sudo cookbook]: https://github.com/chef-cookbooks/sudo

### Default User Settings

See [user cookbook] for options. For now, the defaults are left as is.

To add a user account, add the following to the role/node attributes:

`"users": ["user1", "user2"]`

These will be pulled from the `users` data bag on the chef server.

[user cookbook]: https://github.com/fnichol/chef-user
[ChefDK]: https://downloads.chef.io/chef-dk/
[Vagrant]: https://www.vagrantup.com/
