require 'parliament/ntriple'
require 'parliament/grom/decorator/version'
require 'parliament/grom/decorator/constituency_area'

module Parliament
  module Grom
    module Decorator
      def self.assign_decorator(object)
        return object unless object.respond_to?(:type)

        object_type = ::Grom::Helper.get_id(object.type)

        return object unless self.constants.include?(object_type.to_sym)

        decorator_module = Object.const_get("Parliament::NTriple::Decorator::#{object_type}")
        object.extend(decorator_module)
      end
    end
  end
end
