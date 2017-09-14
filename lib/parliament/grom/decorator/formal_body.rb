module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: http://id.ukpds.org/schema/FormalBody.
      # rubocop:disable ModuleLength
      module FormalBody
        include Helpers::DateHelper

        # Checks if Grom::Node has a name.
        #
        # @return [String, String] a string depending on whether or not the Grom::Node has a name.
        def name
          @name ||= respond_to?(:formalBodyName) ? formalBodyName : ''
        end

        # Alias formalBodyStartDate with fallback.
        #
        # @return [DateTime, nil] the start date of the Grom::Node or nil.
        def start_date
          @start_date ||= respond_to?(:formalBodyStartDate) ? DateTime.parse(formalBodyStartDate) : nil
        end

        # Alias formalBodyEndDate with fallback.
        #
        # @return [DateTime, nil] the end date of the Grom::Node or nil.
        def end_date
          @end_date ||= respond_to?(:formalBodyEndDate) ? DateTime.parse(formalBodyEndDate) : nil
        end

        # Checks if Grom::Node has an end date.
        #
        # @return [Boolean] a boolean depending on whether or not the Grom::Node has an end date.
        def current?
          end_date.nil?
        end
      end
    end
  end
end
