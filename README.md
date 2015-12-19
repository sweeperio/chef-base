# base

[![Build Status](https://travis-ci.org/sweeperio/chef-base.svg?branch=master)](https://travis-ci.org/sweeperio/chef-base)

A cookbook for all machines. This should be put at the top of the run list for almost all machines.

## Contributing

To do any of the things, you'll need [ChefDK] and [Vagrant] installed.

* Lint: `chef exec rubocop`
* Run Specs: `chef exec rspec`
* Run Integration Tests: `chef exec kitchen test` (will destroy and recreate box)

It's faster to run `chef exec kitchen converge && chef exec kitchen verify` while developing. Just make sure to run test

### The Rest, You Already Know

1. Fork this repo and create a branch
1. Add tests that will fail without your code, and pass with it
1. Use Chef idioms and helpers
1. Push your branch and submit a pull request
on a clean box before pushing.

[ChefDK]: https://downloads.chef.io/chef-dk/
[Vagrant]: https://www.vagrantup.com/
