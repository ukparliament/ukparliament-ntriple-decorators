module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: http://id.ukpds.org/schema/Party
      module Party
        # Alias partyName with fallback.
        #
        # @return [String, String] the party name of the Grom::Node or an empty string.
        def name
          respond_to?(:partyName) ? partyName : ''
        end

        # Alias partyHasPartyMembership with fallback.
        #
        # @return [Array, Array] the party memberships of the Grom::Node or an empty array.
        def party_memberships
          respond_to?(:partyHasPartyMembership) ? partyHasPartyMembership : []
        end

        # Alias count with fallback.
        #
        # @return [Integer, nil] the count of members of the Grom::Node or nil.
        def member_count
          respond_to?(:count) ? count.to_i : nil
        end

        # Alias commonsCount with fallback.
        #
        # @return [Integer, nil] the count of Members of the House of Commons of the Grom::Node or nil.
        def commons_count
          respond_to?(:commonsCount) ? commonsCount.to_i : nil
        end

        # Alias lordsCount with fallback.
        #
        # @return [Integer, nil] the count of Members of the House of Lords of the Grom::Node or nil.
        def lords_count
          respond_to?(:lordsCount) ? lordsCount.to_i : nil
        end

        # Checks if Grom::Node has any current members.
        #
        # @return [Boolean] a boolean depending on whether or not the Grom::Node has any current members.
        def current?
          no_current_total_members = member_count.nil? || member_count.zero?
          no_current_separate_members = (commons_count.nil? || commons_count.zero?) && (lords_count.nil? || lords_count.zero?)
          !no_current_total_members || !no_current_separate_members
        end
      end
    end
  end
end
