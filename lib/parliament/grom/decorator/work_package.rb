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

        def business_item
          return @business_item if @business_item
          return nil unless respond_to?(:workPackageHasBusinessItem)

          @business_item = Helpers::Utils.type_safe_first(workPackageHasBusinessItem, Parliament::Grom::Decorator::BusinessItem)
        end

        # Alias workPackageHasWorkPackagedThing with fallback.
        #
        # @return [Grom::Node, nil] a WorkPackagedThing Grom::Node or nil.
        def work_packaged_thing
          return @work_packaged_thing if @work_packaged_thing
          return nil unless respond_to?(:workPackageHasWorkPackagedThing)

          @work_packaged_thing = Helpers::Utils.type_safe_first(workPackageHasWorkPackagedThing, Parliament::Grom::Decorator::WorkPackagedThing)
        end
      end
    end
  end
end
