require 'parliament/grom/decorator/version'
require 'parliament/grom/decorator/helpers'

Dir['./lib/parliament/grom/decorator/*.rb'].each { |file| require file }

# Namespace for classes and modules that handle connections to, and processing of data from the parliamentary API.
# @since 0.1.0
module Parliament
  module Grom
    # Namespace for Grom decorators.
    #
    # @since 0.1.0
    module Decorator
      INTERNAL_MODULES = %i[
        Helpers
        VERSION
      ].freeze

      MAPPING = {}
      (constants - INTERNAL_MODULES).each { |constant| MAPPING[constant.to_s] = const_get(constant) }

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

        # Decorates objects with alias methods extended from its decorator module.
        #
        # @param [Grom::Node] object the object to be decorated.
        def decorate(object)
          return object unless object.respond_to?(:type)

          Array(object.type).each do |type|
            decorator = MAPPING[::Grom::Helper.get_id(type)] # Get the decorator for a type, or nil

            object.extend(decorator) unless decorator.nil?
          end

          object
        end
      end
    end
  end
end

Parliament::Grom::Decorator.load!
