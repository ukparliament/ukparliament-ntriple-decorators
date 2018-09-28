module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/WorkPackage
      module WorkPackage
        # Alias workPackageHasProcedure with fallback.
        # NB: Currently, work packages only have one procedure
        #
        # @return [Grom::Node, nil] a Procedure Grom::Node or nil.
        def procedure
          return @procedure if @procedure
          return nil unless respond_to?(:workPackageHasProcedure)

          @procedure = Helpers::Utils.type_safe_first(workPackageHasProcedure, Parliament::Grom::Decorator::Procedure)
        end
      end
    end
  end
end