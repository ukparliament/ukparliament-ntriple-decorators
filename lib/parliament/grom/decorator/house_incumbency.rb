module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: http://id.ukpds.org/schema/HouseIncumbency
      module HouseIncumbency
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

        # Alias houseIncumbencyHasHouse with fallback.
        #
        # @return [Grom::Node, nil] the house of the Grom::Node or nil.
        def house
          respond_to?(:houseIncumbencyHasHouse) ? houseIncumbencyHasHouse.first : nil
        end

        # Alias parliamentaryIncumbencyHasMember with fallback.
        #
        # @return [Grom::Node, nil] the member connected to the Grom::Node or nil.
        def member
          respond_to?(:parliamentaryIncumbencyHasMember) ? parliamentaryIncumbencyHasMember.first : nil
        end

        # Alias parliamentaryIncumbencyHasContactPoint with fallback.
        #
        # @return [Array, Array] the contact points of the Grom::Node or an empty array.
        def contact_points
          respond_to?(:parliamentaryIncumbencyHasContactPoint) ? parliamentaryIncumbencyHasContactPoint : []
        end
      end
    end
  end
end
