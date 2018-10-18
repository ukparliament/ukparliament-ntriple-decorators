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

      end
    end
  end
end
