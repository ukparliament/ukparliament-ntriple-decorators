module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/WorkdPackagedThing
      module WorkPackagedThing
        # Alias workPackagedThingHasWorkPackage with fallback.
        #
        # @return [Grom::Node, nil] a work package Grom::Node or nil.
        def work_package
          return @work_package if @work_package
          return nil unless respond_to?(:workPackagedThingHasWorkPackage)

          @work_package = Helpers::Utils.type_safe_first(workPackagedThingHasWorkPackage, Parliament::Grom::Decorator::WorkPackage)
        end
      end
    end
  end
end
