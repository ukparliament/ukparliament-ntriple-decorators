module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/Answer.
      module Answer
        include Helpers::DateHelper
        # Alias answerText with fallback.
        #
        # @return [String, String] the text of the Grom::Node or an empty string.
        def text
          respond_to?(:answerText) ? answerText : ''
        end

        # Alias answerGivenDate with fallback.
        #
        # @return [DateTime, nil] the answer date of the Grom::Node or nil.
        def answer_given_date
          @answer_given_date ||= respond_to?(:answerGivenDate) ? DateTime.parse(answerGivenDate) : nil
        end

        # Alias answerHasAnsweringPerson with fallback.
        #
        # @return [Grom::Node, nil] the answering_person of the Grom::Node or nil.
        def answering_person
          respond_to?(:answerHasAnsweringPerson) ? answerHasAnsweringPerson.first : nil
        end
      end
    end
  end
end
