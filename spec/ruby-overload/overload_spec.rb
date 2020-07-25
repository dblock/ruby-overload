# frozen_string_literal: true

require 'spec_helper'

describe Ruby::Overload do
  let(:klass) do
    Class.new do
      include Ruby::Overload

      attr_reader :called

      def call
        @called ||= []
        @called << 'call'
      end

      def call(arg)
        @called ||= []
        @called << "call:#{arg}"
      end
    end
  end
  subject do
    klass.new
  end
  it 'calls overloaded methods' do
    subject.call
    subject.call 1
    subject.call 'arg'
    expect(subject.called).to eq(['call', 'call:1', 'call:arg'])
  end
  it 'only calls overloaded methods' do
    expect { subject.call 1, 2 }.to raise_error NoMethodError
  end
end
