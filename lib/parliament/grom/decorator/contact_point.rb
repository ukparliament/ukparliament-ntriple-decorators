module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/ContactPoint
      module ContactPoint
        # Alias contactPointHasPostalAddress with fallback.
        #
        # @return [Array, Array] an array of the postal addresses for the Grom::Node or an empty array.
        def postal_addresses
          respond_to?(:contactPointHasPostalAddress) ? contactPointHasPostalAddress.reject { |address| address.full_address.length < 3 } : []
        end

        # Alias email with fallback.
        #
        # @return [String, String] the email of the Grom::Node or an empty string.
        def email
          instance_variable_get('@email'.to_sym) && instance_variable_get('@email'.to_sym).length > 3 ? instance_variable_get('@email'.to_sym).strip : ''
        end

        # Alias phoneNumber with fallback.
        #
        # @return [String, String] the phone number of the Grom::Node or an empty string.
        def phone_number
          respond_to?(:phoneNumber) && phoneNumber.length > 3 ? phoneNumber : ''
        end

        # Alias faxNumber with fallback.
        #
        # @return [String, String] the fax number of the Grom::Node or an empty string.
        def fax_number
          respond_to?(:faxNumber) && faxNumber.length > 3 ? faxNumber : ''
        end

        # Alias contactPointHasPerson with fallback.
        #
        # @return [Array, Array] the person connected to the Grom::Node or an empty array.
        def person
          respond_to?(:contactPointHasPerson) ? contactPointHasPerson : []
        end

        # Alias contactPointHasParliamentaryIncumbency with fallback.
        #
        # @return [Grom::Node, nil] the parliamentary incumbency of the Grom::Node or nil.
        def parliamentary_incumbency
          respond_to?(:contactPointHasParliamentaryIncumbency) ? contactPointHasParliamentaryIncumbency.first : nil
        end
      end
    end
  end
end
