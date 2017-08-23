module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: http://id.ukpds.org/schema/FormalBody.
      # rubocop:disable ModuleLength
      module FormalBody
        # Checks if Grom::Node has a name.
        #
        # @return [String, String] a string depending on whether or not the Grom::Node has a name.
        def name
          @name ||= respond_to?(:formalBodyName) ? formalBodyName : ''
        end
      end
    end
  end
end
