module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: http://id.ukpds.org/schema/governmentIncumbency.
      # rubocop:disable ModuleLength
      module GovernmentIncumbency
        include Helpers::DateHelper

        # Alias parliamentaryIncumbencyStartDate with fallback.
        #
        # @return [DateTime, nil] the start date of the Grom::Node or nil.
        def start_date
          @start_date ||= respond_to?(:parliamentaryIncumbencyStartDate) ? DateTime.parse(parliamentaryIncumbencyStartDate) : nil
        end

        # Alias parliamentaryIncumbencyEndDate with fallback.
        #
        # @return [DateTime, nil] the end date of the Grom::Node or nil.
        def end_date
          @end_date ||= respond_to?(:parliamentaryIncumbencyEndDate) ? DateTime.parse(parliamentaryIncumbencyEndDate) : nil
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
