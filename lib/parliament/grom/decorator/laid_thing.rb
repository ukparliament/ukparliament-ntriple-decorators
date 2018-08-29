module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/LaidThing
      module LaidThing
        # Alias laidThingHasLaying with fallback.
        #
        # @return [Grom::Node, nil] a laying Grom::Node or nil.
        def laying
          respond_to?(:laidThingHasLaying) ? laidThingHasLaying.first : nil
        end
      end
    end
  end
end
