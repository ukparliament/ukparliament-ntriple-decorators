module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: http://data.ordnancesurvey.co.uk/ontology/admingeo/EuropeanRegion.
      module EuropeanRegion
        # Alias prefLabel with fallback.
        #
        # @return [String, String] the given name of the Grom::Node or an empty string.
        def name
          respond_to?(:prefLabel) ? prefLabel : ''
        end

        # Alias gssCode with fallback.
        #
        # @return [String, String] the given name of the Grom::Node or nil.
        def gss_code
          respond_to?(:gssCode) ? gssCode : nil
        end

        # Alias count with fallback.
        #
        # @return [String, String] the count of the Grom::Node or nil.
        def constituency_count
          respond_to?(:count) ? count : nil
        end
      end
    end
  end
end
