module Parliament
  module Grom
    module Decorator
      module Helpers
        # Namespace for utility methods
        module Utils
          class << self
            # Checks that a collection responds to first and that the first element is of the given class
            #
            # @param [Enumerable] enumerable object which responds to #first
            # @param [Class] klass the class we expect the first element to be
            #
            # @example When the first element is of the expected class
            #   Parliament::Grom::Decorator::Helpers::Utils.type_safe_first(['hello'], String) #=> 'hello'
            #
            # @example When the first element is not of the expected class
            #   Parliament::Grom::Decorator::Helpers::Utils.type_safe_first(['hello'], Fixnum) #=> nil
            #
            # @example When the enumerable does not respond to first
            #   Parliament::Grom::Decorator::Helpers::Utils.type_safe_first('hello', String) #=> nil
            #
            # @return [String] formatted date range
            def type_safe_first(enumerable, klass)
              return nil unless enumerable.respond_to?(:first)

              first_element = enumerable.first

              return nil unless first_element.is_a?(klass)

              first_element
            end
          end
        end
      end
    end
  end
end
