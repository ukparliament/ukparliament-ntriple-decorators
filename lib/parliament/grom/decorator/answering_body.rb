module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/AnsweringBody.
      module AnsweringBody
        # Alias groupName with fallback.
        #
        # @return [String, STring] the name of the Grom::Node or an empty string.
        def name
          respond_to?(:groupName) ? groupName : ''
        end

        # Alias answeringBodyHasAnswer with fallback.
        #
        # @return [Grom::Node, []] the answer of the Grom::Node or nil.
        def answers
          respond_to?(:answeringBodyHasAnswer) ? answeringBodyHasAnswer : []
        end
      end
    end
  end
end
