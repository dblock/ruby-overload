require 'benchmark/ips'
require 'ruby-overload'

class Foo
  include Ruby::Overload

  def call(number)
    "foo #{number}"
  end

  def call
    'foo 42'
  end
end

class Bar
  def call(number)
    "bar #{number}"
  end
end

foo = Foo.new
bar = Bar.new

Benchmark.ips do |x|
  x.report('method overloading') { foo.call(23) }
  x.report('method') { bar.call(23) }
  x.compare!
end
