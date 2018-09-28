module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/LaidThing
      module LaidThing
        # Alias laidThingHasLaying with fallback.
        #
        # @return [Grom::Node, nil] a laying Grom::Node or nil.
        def laying
          return @laying if @laying
          return nil unless respond_to?(:laidThingHasLaying)

          @laying = Helpers::Utils.type_safe_first(laidThingHasLaying, Parliament::Grom::Decorator::Laying)
        end
      end
    end
  end
end
