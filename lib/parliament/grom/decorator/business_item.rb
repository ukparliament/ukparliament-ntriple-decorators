module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/BusinessItem
      module BusinessItem
        include Helpers::DateHelper
        # Alias businessItemeHasProcedureStep with fallback.
        # NB: Currently, business items only have one procedure step
        #
        # @return [Grom::Node, nil] a Procedure Step Grom::Node or nil.
        def procedure_step
          return @procedure_step if @procedure_step
          return nil unless respond_to?(:businessItemHasProcedureStep)

          @procedure_step = Helpers::Utils.type_safe_first(businessItemHasProcedureStep, Parliament::Grom::Decorator::ProcedureStep)
        end

        # Alias businessItemDate with fallback.
        #
        # @return [Date, nil] the date of the Grom::Node or nil.
        def date
          respond_to?(:businessItemDate) ? DateTime.parse(businessItemDate) : nil
        end

        # Alias businessItemHasWorkPackage with fallback.
        #
        # @return [Grom::Node, nil] the WorkPackage of the Grom::Node or nil.
        def work_package
          return @work_package if @work_package

          return nil unless respond_to?(:businessItemHasWorkPackage)

          @work_package = Helpers::Utils.type_safe_first(businessItemHasWorkPackage, Parliament::Grom::Decorator::WorkPackage)
        end
      end
    end
  end
end
