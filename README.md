Ruby::Overload
==========

[![Gem Version](http://img.shields.io/gem/v/ruby-overload.svg)](http://badge.fury.io/rb/ruby-overload)
[![Build Status](https://travis-ci.org/dblock/ruby-overload.svg?branch=master)](https://travis-ci.org/dblock/ruby-overload)

Runtime method overloading behavior for Ruby from [this blog post](https://lucaguidi.com/2020/07/22/ruby-method-overloading/) by [@jodosha](https://www.github.com/jodosha).

## Usage

Requires Ruby 2.7+.

```
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

Copyright (c) 2020, Luca Guidi, Daniel Doubrovkine and [Contributors](CHANGELOG.md).

This project is licensed under the [MIT License](LICENSE.md).

## Similar Projects

* [overloader](https://github.com/pocke/overloader)
