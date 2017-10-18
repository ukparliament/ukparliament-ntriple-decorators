module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/GenderIdentity
      module GenderIdentity
        # Alias genderIdentityHasGender with fallback.
        #
        # @return [Grom::Node, nil] a Grom::Node with type https://id.parliament.uk/schema/Gender or nil.
        def gender
          respond_to?(:genderIdentityHasGender) ? genderIdentityHasGender.first : nil
        end
      end
    end
  end
end
