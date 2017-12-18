module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: http://example.com/content/Audience
      # Audience Grom::Node is a Contentful object associated with a web article (a WebArticle has an Audience node)
      # Audience Grom::Node is not modelled in the data service, hence type 'http://example..' and not 'https://id.parliament.uk/schema'
      module Audience
        # Alias name with fallback.
        #
        # @return [String, String] the title of the Grom::Node or an empty string.
        def audience_name
          respond_to?(:name) ? name : ''
        end
      end
    end
  end
end
