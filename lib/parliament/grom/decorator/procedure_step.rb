module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/ProcedureStep
      module ProcedureStep
        # Alias procedureStepHasBusinessItem with fallback.
        #
        # @return [Array, Array] an array of BusinessItem Grom::Nodes or an empty array.
        def business_items
          @business_items ||= respond_to?(:procedureStepHasBusinessItem) ? procedureStepHasBusinessItem : []
        end

        # Alias procedureStepHasHouse with fallback.
        #
        # @return [Array, Array] an array of House Grom::Nodes or an empty array.
        def houses
          @houses ||= respond_to?(:procedureStepHasHouse) ? procedureStepHasHouse : []
        end
      end
    end
  end
end
