module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/FormalBodyChair.
      module FormalBodyChair
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
