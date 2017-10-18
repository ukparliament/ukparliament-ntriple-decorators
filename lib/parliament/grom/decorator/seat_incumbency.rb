module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/SeatIncumbency
      module SeatIncumbency
        include Helpers::DateHelper
        # Alias parliamentaryIncumbencyStartDate with fallback.
        #
        # @return [DateTime, nil] the start date of the Grom::Node or nil.
        def start_date
          respond_to?(:parliamentaryIncumbencyStartDate) ? DateTime.parse(parliamentaryIncumbencyStartDate) : nil
        end

        # Alias parliamentaryIncumbencyEndDate with fallback.
        #
        # @return [DateTime, nil] the end date of the Grom::Node or nil.
        def end_date
          respond_to?(:parliamentaryIncumbencyEndDate) ? DateTime.parse(parliamentaryIncumbencyEndDate) : nil
        end

        # Alias seatIncumbencyHasHouseSeat with fallback.
        #
        # @return [Grom::Node, nil] the seat of the Grom::Node or nil.
        def seat
          respond_to?(:seatIncumbencyHasHouseSeat) ? seatIncumbencyHasHouseSeat.first : nil
        end

        # Checks if Grom::Node has no end date.
        #
        # @return [Boolean] a boolean depending on whether or not the Grom::Node has an end date.
        def current?
          !former?
        end

        # Checks if Grom::Node has an end date.
        #
        # @return [Boolean] a boolean depending on whether or not the Grom::Node has an end date.
        def former?
          respond_to?(:parliamentaryIncumbencyEndDate)
        end

        # Alias houseSeatHasHouse with fallback.
        #
        # @return [Grom::Node, nil] the house of the Grom::Node or nil.
        def house
          seat.nil? ? nil : seat.house
        end

        # Alias houseSeatHasConstituencyGroup with fallback.
        #
        # @return [Grom::Node, nil] the constituency of the Grom::Node or nil.
        def constituency
          seat.nil? ? nil : seat.constituency
        end

        # Alias parliamentaryIncumbencyHasContactPoint with fallback.
        #
        # @return [Array, Array] the contact points of the Grom::Node or an empty array.
        def contact_points
          respond_to?(:parliamentaryIncumbencyHasContactPoint) ? parliamentaryIncumbencyHasContactPoint : []
        end

        # Alias parliamentaryIncumbencyHasMember with fallback.
        #
        # @return [Grom::Node, nil] the member connected to the Grom::Node or nil.
        def member
          respond_to?(:parliamentaryIncumbencyHasMember) ? parliamentaryIncumbencyHasMember.first : nil
        end
      end
    end
  end
end
