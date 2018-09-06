require 'parliament/grom/decorator/version'
require 'parliament/grom/decorator/helpers'

Dir[File.dirname(__FILE__) + '/decorator/*.rb'].each { |file| require file }

# Namespace for classes and modules that handle connections to, and processing of data from the parliamentary API.
# @since 0.1.0
module Parliament
  module Grom
    # Namespace for Grom decorators.
    #
    # @since 0.1.0
    module Decorator
      internal_modules = %i[
        Helpers
        VERSION
      ].freeze

      mapping_hash = {}
      (constants - internal_modules).each { |constant| mapping_hash[constant.to_s] = const_get(constant) }
      MAPPING = mapping_hash.freeze

      class << self
        # Gets the root directory of the gem
        def gem_path
          File.expand_path '../../..', __dir__
        end

        def load!
          # Loads the translation file into the I18n gem
          I18n.load_path += Dir[File.join(gem_path, 'config', 'locales', '*.yml')]
          I18n.backend.load_translations
        end

        # Decorates objects with alias methods extended from decorator modules.
        # This method reads each of the `#type` values and extends the object with a decorator for that type,
        # if available.
        #
        # @param [Grom::Node] object the object to be decorated.
        # @return [Grom::Node] the object which has been decorated.
        def decorate(object)
          return object unless object.respond_to?(:type)

          Array(object.type).each do |type|
            object = decorate_with_type(object, type)
          end

          object
        end

        # Decorates objects with alias methods extended from a decorator module.
        # This method decorated an object with a module matching the type provided.
        #
        # @param [Grom::Node] object the object to be decorated.
        # @param [string] type the type we are decorating our object for/
        # @return [Grom::Node] the object which has been decorated.
        def decorate_with_type(object, type)
          decorator = MAPPING[::Grom::Helper.get_id(type)] # Get the decorator for a type, or nil
          object.extend(decorator) unless decorator.nil?

          object
        end
      end
    end
  end
end

Parliament::Grom::Decorator.load!
