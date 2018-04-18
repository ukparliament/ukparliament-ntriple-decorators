module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/AnsweringBodyAllocation.
      module AnsweringBodyAllocation
        # Alias answeringBodyAllocationHasAnsweringBody with fallback.
        #
        # @return [Grom::Node, nil] the answering_body of the Grom::Node or nil.
        def answering_body
          respond_to?(:answeringBodyAllocationHasAnsweringBody) ? answeringBodyAllocationHasAnsweringBody.first : nil
        end
      end
    end
  end
end
