# frozen_string_literal: true

module Ruby
  module Overload
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def method_added(method_name)
        if @_recurse_catch
          @_recurse_catch = nil
          return
        end

        original_method = instance_method(method_name)

        @_matches ||= Hash.new { |h, k| h[k] = {} }
        @_matches[method_name][original_method.arity] = original_method
        undef_method method_name

        # Prevent recursive calls to method_added if we're doing it
        # intentionally here.
        @_recurse_catch = true

        # Localize for closure
        method_matches = @_matches[method_name]

        if @_methods && @_methods[method_name]
          define_method(method_name, @_methods[method_name])
        else
          define_method(method_name) do |*as|
            method_matches[as.size].bind(self).call(*as)
          end

          @_methods ||= {}
          @_methods[method_name] = instance_method(method_name)
        end
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
