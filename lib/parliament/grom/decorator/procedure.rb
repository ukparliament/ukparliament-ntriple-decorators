module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/Procedure
      module Procedure
        # Alias procedureName with fallback.
        #
        # @return [String, String] the name of the Grom::Node or an empty string.
        def name
          respond_to?(:procedureName) ? procedureName : ''
        end

        # Alias procedureHasWorkPackage with fallback.
        #
        # @return [Array, Array] an array of WorkPackage Grom::Nodes or an empty array.
        def work_packages
          respond_to?(:procedureHasWorkPackage) ? procedureHasWorkPackage : []
        end
      end
    end
  end
end
