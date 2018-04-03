module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/governmentIncumbency.
      module GovernmentIncumbency
        include Helpers::DateHelper

        # Alias incumbencyStartDate with fallback.
        #
        # @return [DateTime, nil] the start date of the Grom::Node or nil.
        def start_date
          @start_date ||= respond_to?(:incumbencyStartDate) ? DateTime.parse(incumbencyStartDate) : nil
        end

        # Alias incumbencyEndDate with fallback.
        #
        # @return [DateTime, nil] the end date of the Grom::Node or nil.
        def end_date
          @end_date ||= respond_to?(:incumbencyEndDate) ? DateTime.parse(incumbencyEndDate) : nil
        end

        # Checks if Grom::Node has an end date.
        #
        # @return [Boolean] a boolean depending on whether or not the Grom::Node has an end date.
        def current?
          end_date.nil?
        end

        # Alias governmentIncumbencyHasGovernmentPosition with fallback.
        #
        # @return [Grom::Node, nil] the start date of the Grom::Node or nil.
        def government_position
          respond_to?(:governmentIncumbencyHasGovernmentPosition) ? governmentIncumbencyHasGovernmentPosition&.first : nil
        end
      end
    end
  end
end
