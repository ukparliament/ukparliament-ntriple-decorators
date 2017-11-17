module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/oppositionPosition.
      module OppositionPosition
        # Checks if Grom::Node has a name.
        #
        # @return [String, String] a string depending on whether or not the Grom::Node has a name.
        def name
          @name ||= respond_to?(:positionName) ? positionName : ''
        end
      end
    end
  end
end
