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

        # Alias formalBodyName with fallback.
        #
        # @return [String, String] the formal body name of the Grom::Node or an empty string.
        def formal_body_name
           @formal_body_name ||= respond_to?(:formalBodyName) ? formalBodyName : ''
        end

        # Alias formalBodyRemit with fallback.
        #
        # @return [String, String] the formal body remit of the Grom::Node or an empty string.
        def formal_body_remit
          @formal_body_remit ||= respond_to?(:formalBodyRemit) ? formalBodyRemit : ''
        end

        # Alias member count with fallback.
        #
        # @return [Integer, nil] the count of members of the Grom::Node or nil.
        def member_count
          respond_to?(:count) ? count.to_i : nil
        end

        # Alias is_joint with fallback.
        #
        # @return [Boolean] a boolean depending on whether or not the Grom::Node is joint.
        def is_joint?
           respond_to?(:formalBodyHasLeadHouse)
        end

        # Alias is_chair with fallback.
        #
        # @return [Boolean] a boolean depending on whether or not the Grom::Node is chair.
        def is_chair?
          respond_to?(:formalBodyHasFormalBodyChair)
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
