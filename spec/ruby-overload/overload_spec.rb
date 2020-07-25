# frozen_string_literal: true

require 'spec_helper'

describe Ruby::Overload do
  let(:klass) do
    Class.new do
      include Ruby::Overload

      def call
        nil
      end

      def call(arg)
        arg
      end

      def call(first, second)
        [first, second]
      end
    end
  end
  subject do
    klass.new
  end
  it 'matches on a method with no arguments' do
    expect(subject.call).to be nil
  end
  it 'matches on methods with one argument' do
    expect(subject.call(1)).to eq 1
  end
  it 'matches on methods with two arguments' do
    expect(subject.call(%w[a b])).to eq(%w[a b])
  end
  it 'raises undefined method when method is not defined' do
    expect { subject.call 1, 2, 3 }.to raise_error NoMethodError
  end
end
