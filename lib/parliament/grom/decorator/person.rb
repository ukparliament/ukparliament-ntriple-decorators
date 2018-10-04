module Parliament
  module Grom
    module Decorator
      module Person
        # Builds a full name using personGivenName and personFamilyName.
        #
        # @return [String, String] the full name of the Grom::Node or an empty string.
        def full_name
          return @full_name unless @full_name.nil?

          full_name = []
          full_name << personGivenName if respond_to?(:personGivenName)
          full_name << personFamilyName if respond_to?(:personFamilyName)

          @full_name = full_name.join(' ')
        end

        # Alias F31CBD81AD8343898B49DC65743F0BDF with fallback.
        #
        # @return [String, String] the display name of the Grom::Node or the full name.
        def display_name
          respond_to?(:F31CBD81AD8343898B49DC65743F0BDF) ? self.F31CBD81AD8343898B49DC65743F0BDF : full_name
        end
      end
    end
  end
end
