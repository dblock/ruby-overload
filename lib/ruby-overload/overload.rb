# frozen_string_literal: true

module Ruby
  module Overload
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def method_added(method_name)
        m = instance_method(method_name)
        method_id = [method_name, m.arity]

        @__method_overloading ||= {}
        @__method_overloading[method_id] = m
        undef_method method_name
      end

      def respond_to_matching?(method_name, *args)
        @__method_overloading&.key?([method_name, args.count])
      end

      def matched_call(instance, method_name, *args)
        m = @__method_overloading[[method_name, args.count]]
        m.bind(instance).call(*args)
      end
    end

    def method_missing(method_name, *args, &blk)
      super unless self.class.respond_to_matching?(method_name, *args, &blk)

      self.class.matched_call(self, method_name, *args, &blk)
    end

    def respond_to_missing?(method_name, *)
      self.class.respond_to_method?(method_name)
    end
  end
end
