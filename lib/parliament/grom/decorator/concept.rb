module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/Concept
      module Concept
        # Alias conceptLabel with fallback.
        #
        # @return [String, String] the IDMS title of the Grom::Node or an empty string.
        def name
          respond_to?(:conceptLabel) ? conceptLabel : ''
        end

        # Alias conceptScopeNote with fallback.
        #
        # @return [String, String] the IDMS description of the Grom::Node or an empty string.
        def description
          respond_to?(:conceptScopeNote) ? conceptScopeNote : ''
        end

        # Alias conceptDefinition with fallback.
        #
        # @return [String, String] the IDMS description of the Grom::Node or an empty string.
        def definition
          respond_to?(:conceptDefinition) ? conceptDefinition : ''
        end

        # Alias conceptHasSubjectTaggedThing with fallback.
        #
        # @return [Array, Array] array of WebArticle Grom::Nodes tagged with that concept or an empty array.
        def tagged_articles
          respond_to?(:conceptHasSubjectTaggedThing) ? conceptHasSubjectTaggedThing : []
        end

        # Alias conceptHasBroaderConcept with fallback.
        #
        # @return [Array, Array] array of parent Concept Grom::Nodes or an empty array.
        def broader_concepts
          respond_to?(:conceptHasBroaderConcept) ? conceptHasBroaderConcept : []
        end

        # Alias conceptHasNarrowerConcept with fallback.
        #
        # @return [Array, Array] array of child Concept Grom::Nodes or an empty array.
        def narrower_concepts
          respond_to?(:conceptHasNarrowerConcept) ? conceptHasNarrowerConcept : []
        end
      end
    end
  end
end
