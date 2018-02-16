module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/Group.
      # rubocop:disable ModuleLength
      module Group
        include Helpers::DateHelper

        # Alias groupStartDate with fallback.
        #
        # @return [DateTime, nil] the start date of the Grom::Node or nil.
        def start_date
          @start_date ||= respond_to?(:groupStartDate) ? DateTime.parse(groupStartDate) : nil
        end

        # Alias groupEndDate with fallback.
        #
        # @return [DateTime, nil] the end date of the Grom::Node or nil.
        def end_date
          @end_date ||= respond_to?(:groupEndDate) ? DateTime.parse(groupEndDate) : nil
        end

        # Alias groupName with fallback.
        #
        # @return [String, String] the name of the Grom::Node or an empty string.
        def name
          respond_to?(:groupName) ? groupName : ''
        end
      end
    end
  end
end
