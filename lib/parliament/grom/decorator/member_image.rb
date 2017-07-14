module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: http://id.ukpds.org/schema/MemberImage
      module MemberImage
        # Alias memberImageHasMember with fallback.
        #
        # @return [Grom::Node, nil] the person connected to the Grom::Node or nil.
        def person
          respond_to?(:memberImageHasMember) ? memberImageHasMember.first : nil
        end
      end
    end
  end
end
