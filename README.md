# Parliament::Grom::Decorators

[parliament-grom-decorators](http://rubygems.org/gems/parliament-grom-decorators) is a gem created by the [Parliamentary Digital Service](https://www.parliament.uk/mps-lords-and-offices/offices/bicameral/parliamentary-digital-service/) to allow Grom::Node objects to be extended with alias methods.

> **NOTE:** This gem is in active development and is likely to change at short notice. It is not recommended that you use this in any production environment.

## Requirements
[parliament-grom-decorators](http://github.com/ukparliament/parliament-grom-decorators) requires the following:
* [Ruby](https://www.ruby-lang.org/en/)
* [Bundler](http://http://bundler.io/)

## Installation

This gem is currently not available on RubyGems. To use it in an application, install it directly from GitHub via your Gemfile
```bash
gem 'parliament-grom-decorators', git: 'https://github.com/ukparliament/parliament-grom-decorators.git', branch: 'master'
```

## Usage

This gem's main function is to extend Grom::Node objects with alias methods.

> **Note:** Comprehensive class documentation can be found on [rubydocs](http://www.rubydoc.info/github/ukparliament/parliament-grom-decorators/master/file/README.md).

## Getting Started with Development
To clone the repository and set up the dependencies, run the following:
```bash
git clone https://github.com/ukparliament/parliament-grom-decorators.git
cd parliament-grom-decorators
bundle install
```

### Running the tests
We use [RSpec](http://rspec.info/) as our testing framework and tests can be run using:
```bash
bundle exec rake
```

## Contributing
If you wish to submit a bug fix or feature, you can create a pull request and it will be merged pending a code review.

1. Fork the repository
1. Create your feature branch (`git checkout -b my-new-feature`)
1. Commit your changes (`git commit -am 'Add some feature'`)
1. Push to the branch (`git push origin my-new-feature`)
1. Ensure your changes are tested using [Rspec](http://rspec.info/)
1. Create a new Pull Request

This is a test.