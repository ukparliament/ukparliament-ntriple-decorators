module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/BusinessItem
      module BusinessItem
        include Helpers::DateHelper
        # Alias businessItemHasProcedureStep with fallback.
        #
        # @return [Array, Array] an array of ProcedureStep Grom::Nodes of the Grom::Node or an empty array.
        def procedure_steps
          respond_to?(:businessItemHasProcedureStep) ? businessItemHasProcedureStep : []
        end

        # Each procedure step has a distance from origin
        #
        # @return [Array] an array of ProcedureStep Grom::Nodes sorted by distance from origin.
        def sorted_procedure_steps_by_distance
          procedure_steps.sort_by(&:distance_from_origin)
        end

        # Finds, for each of the procedure steps belonging to a business item, the shortest distance from origin
        #
        # @return [Integer, nil] shortest distance of procedure steps from origin or nil.
        def shortest_distance_of_procedure_steps
          sorted_procedure_steps_by_distance.first&.distance_from_origin
        end

        # Alias businessItemDate with fallback.
        #
        # @return [Date, nil] a laying date or nil.
        def date
          respond_to?(:businessItemDate) ? DateTime.parse(businessItemDate) : nil
        end

        # Alias businessItemHasBusinessItemWebLink with fallback.
        #
        # @return [String, String] a web link to view business item Grom::Node or an empty string.
        def weblink
          respond_to?(:businessItemHasBusinessItemWebLink) ? businessItemHasBusinessItemWebLink : ''
        end
      end
    end
  end
end
