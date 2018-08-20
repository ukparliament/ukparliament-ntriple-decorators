module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/LayingBody
      module LayingBody
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
