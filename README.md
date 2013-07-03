SpreeExport
===========

[![Code Climate](https://codeclimate.com/github/ecl1pse/spree_flash_sales.png)](https://codeclimate.com/github/ecl1pse/spree_flash_sales)
[![Dependency Status](https://gemnasium.com/ecl1pse/spree_export.png)](https://gemnasium.com/ecl1pse/spree_export)
[![Coverage Status](https://coveralls.io/repos/ecl1pse/spree_export/badge.png)](https://coveralls.io/r/ecl1pse/spree_export)
[![Build Status](https://travis-ci.org/ecl1pse/spree_export.png?branch=master)](https://travis-ci.org/ecl1pse/spree_export)


Export orders to CSV. Backed with Specs.

Gems are not recommended for Spree extensions.

Please use branch 2-0-stable for production.

Installation
------------

Add spree_export to your Gemfile:

```ruby
gem 'spree_export'
```

Bundle your dependencies and run the installation generator:

```shell
bundle
bundle exec rails g spree_export:install
```

Testing
-------

Be sure to bundle your dependencies and then create a dummy test app for the specs to run against.

```shell
bundle
bundle exec rake test_app
bundle exec rspec spec
```

When testing your applications integration with this extension you may use it's factories.
Simply add this require statement to your spec_helper:

```ruby
require 'spree_export/factories'
```

Copyright (c) 2013 [ecl1pse], released under the New BSD License
