Ruby::Overload
==========

[![Gem Version](http://img.shields.io/gem/v/ruby-overload.svg)](http://badge.fury.io/rb/ruby-overload)
[![Build Status](https://travis-ci.org/dblock/ruby-overload.svg?branch=master)](https://travis-ci.org/dblock/ruby-overload)

Runtime method overloading behavior for Ruby from [this blog post](https://lucaguidi.com/2020/07/22/ruby-method-overloading/) by [@jodosha](https://www.github.com/jodosha). Incorporates changes from [ptolemybarnes/overlord](https://github.com/ptolemybarnes/overlord), performance improvements from [baweaver@](https://gist.github.com/jodosha/e3097ed693e9b7c255b658ac39c2e403#gistcomment-3388594), and other ideas from [this tweet](https://twitter.com/jodosha/status/1285850349845254144).

## Usage

```ruby
require 'ruby-overload'

class Foo
  include Ruby::Overload

  def call
    puts "foo"
  end

  def call(arg)
    puts "foo #{arg}"
  end
end

foo = Foo.new
foo.call # => "foo"
foo.call(23) # => "foo 23"
```

## Contributing

You're encouraged to contribute to this gem. See [CONTRIBUTING](CONTRIBUTING.md) for details.

## Copyright and License

Copyright (c) 2020, Luca Guidi, Brandon Weaver, Daniel Doubrovkine and [Contributors](CHANGELOG.md).

This project is licensed under the [MIT License](LICENSE.md).

## Similar Projects

* [overloader](https://github.com/pocke/overloader)
