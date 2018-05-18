module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/Question.
      module Question
        include Helpers::DateHelper
        # Alias questionHeading with fallback.
        #
        # @return [String, String] the question_title of the Grom::Node or an empty string.
        def question_title
          respond_to?(:questionHeading) ? questionHeading : ''
        end

        # Builds a fallback question heading using indexingAndSearchUri.
        #
        # @return [String, String] the fallback_heading of the Grom::Node.
        def fallback_heading
          "Question #{indexing_search_uri.split('/').last}"
        end

        # Returns heading or fallback_heading.
        #
        # @return [String, String] the heading of the Grom::Node or fallback_heading.
        def heading
          question_title.empty? || question_title.include?('Tabled Parliamentary Question') ? fallback_heading : question_title
        end

        # Alias questionText with fallback.
        #
        # @return [String, String] the text of the Grom::Node or an empty string.
        def text
          respond_to?(:questionText) ? questionText : ''
        end

        # Alias indexingAndSearchUri with fallback.
        #
        # @return [String, String] the indexing_search_uri of the Grom::Node or an empty string.
        def indexing_search_uri
          respond_to?(:indexingAndSearchUri) ? indexingAndSearchUri : ''
        end

        # Alias questionAskedAt with fallback.
        #
        # @return [DateTime, nil] the asked_at_date of the Grom::Node or nil.
        def asked_at_date
          @asked_at_date ||= respond_to?(:questionAskedAt) ? DateTime.parse(questionAskedAt) : nil
        end

        # Alias questionHasAskingPerson with fallback.
        #
        # @return [Grom::Node, nil] the asking_person of the Grom::Node or nil.
        def asking_person
          respond_to?(:questionHasAskingPerson) ? questionHasAskingPerson.first : nil
        end

        # Alias questionHasAnswer with fallback.
        #
        # @return [Array, Array] the answers related to the Grom::Node or an empty array.
        def answers
          respond_to?(:questionHasAnswer) ? questionHasAnswer : []
        end

        # Alias questionHasAnsweringBodyAllocation with fallback.
        #
        # @return [Grom::Node, nil] the answering_body_allocation of the Grom::Node or nil.
        def answering_body_allocation
          respond_to?(:questionHasAnsweringBodyAllocation) ? questionHasAnsweringBodyAllocation.first : nil
        end
      end
    end
  end
end
