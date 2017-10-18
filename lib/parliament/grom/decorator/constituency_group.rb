module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/ConstituencyGroup
      #
      # attr [Boolean] correct verifies that the Grom::Node is the expected constituency.  This is used in conjunction with postcode lookup to verify if the Grom::Node is the expected constituency.
      module ConstituencyGroup
        include Helpers::DateHelper

        attr_accessor :correct
        # Alias constituencyGroupName with fallback.
        #
        # @return [String, String] the name of the Grom::Node or an empty string.
        def name
          respond_to?(:constituencyGroupName) ? constituencyGroupName : ''
        end

        # Alias constituencyGroupStartDate with fallback.
        #
        # @return [DateTime, nil] the start date of the Grom::Node or nil.
        def start_date
          @start_date ||= respond_to?(:constituencyGroupStartDate) ? DateTime.parse(constituencyGroupStartDate) : nil
        end

        # Alias constituencyGroupEndDate with fallback.
        #
        # @return [DateTime, nil] the end date of the Grom::Node or nil.
        def end_date
          @end_date ||= respond_to?(:constituencyGroupEndDate) ? DateTime.parse(constituencyGroupEndDate) : nil
        end

        # Alias constituencyGroupHasHouseSeat with fallback.
        #
        # @return [Array, Array] the house seats of the Grom::Node or an empty array.
        def seats
          respond_to?(:constituencyGroupHasHouseSeat) ? constituencyGroupHasHouseSeat : []
        end

        # Alias houseSeatHasSeatIncumbency with fallback.
        #
        # @return [Array, Array] the seat incumbencies of the Grom::Node or an empty array.
        def seat_incumbencies
          return @seat_incumbencies unless @seat_incumbencies.nil?

          seat_incumbencies = []
          seats.each do |seat|
            seat_incumbencies << seat.seat_incumbencies
          end

          @seat_incumbencies = seat_incumbencies.flatten.uniq
        end

        # Alias parliamentaryIncumbencyHasMember with fallback.
        #
        # @return [Array, Array] the members of the Grom::Node or an empty array.
        def members
          return @members unless @members.nil?

          members = []
          seat_incumbencies.each do |seat_incumbency|
            members << seat_incumbency.member
          end

          @members = members.flatten.uniq
        end

        # Alias constituencyGroupHasConstituencyArea with fallback.
        #
        # @return [Grom::Node, nil] a Grom::Node with type https://id.parliament.uk/schema/ConstituencyArea or nil.
        def area
          respond_to?(:constituencyGroupHasConstituencyArea) ? constituencyGroupHasConstituencyArea.first : nil
        end

        # Alias parliamentaryIncumbencyHasContactPoint with fallback.
        #
        # @return [Array, Array] the contact points of the Grom::Node or an empty array.
        def contact_points
          return @contact_points unless @contact_points.nil?

          contact_points = []
          seat_incumbencies.each do |seat_incumbency|
            contact_points << seat_incumbency.contact_points
          end

          @contact_points = contact_points.flatten.uniq
        end

        # Checks if Grom::Node has an end date.
        #
        # @return [Boolean] a boolean depending on whether or not the Grom::Node has an end date.
        def current?
          has_end_date = respond_to?(:constituencyGroupEndDate)

          !has_end_date
        end

        # Checks if Grom::Node is the correct constituency.
        #
        # @return [Boolean] a boolean depending on whether or not the Grom::Node is the expected constituency.
        def correct?
          @correct || false
        end

        # Alias parliamentaryIncumbencyHasMember with fallback.
        #
        # @return [Array, Array] the current member of the Grom::Node has a display name.
        def current_member_display_name
          return @current_member_display_name unless @current_member_display_name.nil?
          current_incumbency = seat_incumbencies.select(&:current?).first
          @current_member_display_name = current_incumbency.nil? ? nil : current_incumbency.member.display_name
        end

        # Alias party_name with fallback.
        #
        # @return [String, String] the name of the Grom::Node or an empty string.
        def current_member_party_name
          return @party_name unless @party_name.nil?
          current_incumbency = seat_incumbencies.select(&:current?).first

          if current_incumbency
            current_membership = current_incumbency.member.party_memberships.select(&:current?).first
            @party_name = current_membership.nil? ? nil : current_membership.party.name
          else
            @party_name = nil
          end

          @party_name
        end

        # @return [Array, Array] the regions of the Grom::Node or an empty array.
        def regions
          respond_to?(:inEuropeanRegion) ? inEuropeanRegion : []
        end
      end
    end
  end
end
