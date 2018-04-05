module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/FormalBodyChair.
      module FormalBodyType
        # Checks if Grom::Node has a formal body type name.
        #
        # @return [String, String] a string depending on whether or not the Grom::Node has a formal body type name.
        def name
          respond_to?(:formalbodyTypeName) ? formalbodyTypeName : ''
        end
      end
    end
  end
end
