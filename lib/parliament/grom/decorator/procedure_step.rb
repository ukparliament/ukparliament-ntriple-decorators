module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/ProcedureStep
      module ProcedureStep
        # Alias procedureStepName with fallback.
        #
        # @return [String, String] the name of the Grom::Node or an empty string.
        def name
          respond_to?(:procedureStepName) ? procedureStepName : ''
        end

        # Alias procedureStepHasHouse with fallback.
        #
        # @return [Array, Array] an array of House Grom::Nodes or an empty array.
        def houses
          respond_to?(:procedureStepHasHouse) ? procedureStepHasHouse : []
        end

        # Alias distance with fallback.
        #
        # @return [Integer, Integer] an array of House Grom::Nodes or an empty array.
        def distance_from_origin
          respond_to?(:distance) ? distance.to_i : 0
        end

        # Alias procedureStepDescription with fallback.
        #
        # @return [String, String] the description of the ProcedureStep Grom::Node.
        def description
          respond_to?(:procedureStepDescription) ? procedureStepDescription : ''
        end
      end
    end
  end
end
