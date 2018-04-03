module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/Position.
      module Position
        # Alias positionName with fallback.
        #
        # @return [String, String] the name of the Grom::Node or an empty string.
        def name
          respond_to?(:positionName) ? positionName : 'Chair'
        end

        # Alias positionHasIncumbency with fallback.
        #
        # @return [Array, Array] all the incumbencies of the Grom::Node or an empty array.
        def incumbencies
          respond_to?(:positionHasIncumbency) ? positionHasIncumbency : []
        end
      end
    end
  end
end
