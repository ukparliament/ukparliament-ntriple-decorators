require 'parliament/grom/decorator/version'
require 'parliament/grom/decorator/constituency_area'
require 'parliament/grom/decorator/constituency_group'
require 'parliament/grom/decorator/contact_point'
require 'parliament/grom/decorator/gender'
require 'parliament/grom/decorator/gender_identity'
require 'parliament/grom/decorator/house'
require 'parliament/grom/decorator/house_incumbency'
require 'parliament/grom/decorator/house_seat'
require 'parliament/grom/decorator/incumbency'
require 'parliament/grom/decorator/party'
require 'parliament/grom/decorator/party_membership'
require 'parliament/grom/decorator/person'
require 'parliament/grom/decorator/postal_address'
require 'parliament/grom/decorator/seat_incumbency'

module Parliament
  module Grom
    # Namespace for Grom decorators.
    #
    # @since 0.1.0
    module Decorator
      # Decorates objects with alias methods extended from its decorator module.
      #
      # @param [Grom::Node] object the object to be decorated.
      def self.assign_decorator(object)
        return object unless object.respond_to?(:type)

        object_type = ::Grom::Helper.get_id(object.type)

        return object unless constants.include?(object_type.to_sym)

        decorator_module = Object.const_get("Parliament::Grom::Decorator::#{object_type}")
        object.extend(decorator_module)
      end
    end
  end
end
