module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: http://id.ukpds.org/schema/FormalBodyMembership.
      # rubocop:disable ModuleLength
      module FormalBodyMembership
        include Helpers::DateHelper

        # Alias formalBodyMembershipStartDate with fallback.
        #
        # @return [DateTime, nil] the start date of the Grom::Node or nil.
        def start_date
          @start_date ||= respond_to?(:formalBodyMembershipStartDate) ? DateTime.parse(formalBodyMembershipStartDate) : nil
        end

        # Alias formalBodyMembershipEndDate with fallback.
        #
        # @return [DateTime, nil] the end date of the Grom::Node or nil.
        def end_date
          @end_date ||= respond_to?(:formalBodyMembershipEndDate) ? DateTime.parse(formalBodyMembershipEndDate) : nil
        end

        # Checks if Grom::Node has an end date.
        #
        # @return [Boolean] a boolean depending on whether or not the Grom::Node has an end date.
        def current?
          end_date.nil?
        end

        # Alias formalBodyMembershipFormalBody with fallback.
        #
        # @return [Grom::Node, nil] the start date of the Grom::Node or nil.
        def formal_body
          respond_to?(:formalBodyMembershipHasFormalBody) ? formalBodyMembershipHasFormalBody&.first : nil
        end
      end
    end
  end
end
