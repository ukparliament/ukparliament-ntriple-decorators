module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/WebArticle
      module WebArticle
        # Alias title with fallback.
        #
        # @return [String, String] the title of the Grom::Node or an empty string.
        def article_title
          respond_to?(:title) ? title : ''
        end

        # Alias summary with fallback.
        #
        # @return [String, String] the summary of the Grom::Node or an empty string.
        def article_summary
          respond_to?(:summary) ? summary : ''
        end

        # Alias body with fallback.
        #
        # @return [String, String] the body of the Grom::Node or an empty string.
        def article_body
          respond_to?(:body) ? body : ''
        end

        # Alias collection with fallback.
        #
        # @return [Array, Array] array of collection Grom::Nodes or an empty array.
        def collections
          respond_to?(:collection) ? collection : []
        end

        # Alias articleType with fallback.
        #
        # @return [Array, Array] array of articleType Grom::Nodes or an empty array.
        def types
          respond_to?(:articleType) ? articleType : []
        end

        # Alias audience with fallback.
        #
        # @return [Array, Array] array of audience Grom::Nodes or an empty array.
        def audiences
          respond_to?(:audience) ? audience : []
        end

        # Alias topic with fallback.
        #
        # @return [Array, Array] array of topic Grom::Nodes or an empty array.
        def topics
          respond_to?(:topic) ? topic : []
        end

        # Alias publisher with fallback.
        #
        # @return [Array, Array] array of publisher Grom::Nodes or an empty array.
        def publishers
          respond_to?(:publisher) ? publisher : []
        end

        # Alias relatedArticle with fallback.
        #
        # @return [Array, Array] array of article Grom::Nodes or an empty array.
        def related_articles
          respond_to?(:relatedArticle) ? relatedArticle : []
        end
      end
    end
  end
end
