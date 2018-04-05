module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/FormalBody.
      module FormalBody
        include Helpers::DateHelper

        # Checks if Grom::Node has a name.
        #
        # @return [String, String] a string depending on whether or not the Grom::Node has a name.
        def name
          @name ||= respond_to?(:formalBodyName) ? formalBodyName : ''
        end

        # Checks if Grom::Node has a chair.
        #
        # @return [Boolean] a boolean depending on whether or not the Grom::Node is chair.
        def has_chair?
          respond_to?(:formalBodyHasFormalBodyChair)
        end

        # Alias formalBodyStartDate with fallback.
        #
        # @return [DateTime, nil] the start date of the Grom::Node or nil.
        def start_date
          @start_date ||= respond_to?(:formalBodyStartDate) ? DateTime.parse(formalBodyStartDate) : nil
        end

        # Checks if Grom::Node has a remit.
        #
        # @return [String, String] a string depending on whether or not the Grom::Node has a remit.
        def remit
          @remit ||= respond_to?(:formalBodyRemit) ? formalBodyRemit : ''
        end

        # Checks if Grom::Node is joint.
        #
        # @return [Boolean] a boolean depending on whether or not the Grom::Node is joint.
        def joint?
          respond_to?(:formalBodyHasLeadHouse)
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

        # Checks if Grom::Node has contact points.
        #
        # @return [Array, Array] an arry containing the contact_point(s), or an empty array.
        def contact_points
          @contact_points ||= respond_to?(:formalBodyHasContactPoint) ? Array(formalBodyHasContactPoint) : []
        end
      end
    end
  end
end
