module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: http://id.ukpds.org/schema/Parliaments
      module ParliamentPeriod
        include Helpers::DateHelper

        # Alias parliamentPeriodStartDate with fallback.
        #
        # @return [DateTime, nil] the start date of the Grom::Node or nil.
        def start_date
          @start_date ||= respond_to?(:parliamentPeriodStartDate) ? DateTime.parse(parliamentPeriodStartDate) : nil
        end

        # Alias parliamentPeriodEndDate with fallback.
        #
        # @return [DateTime, nil] the end date of the Grom::Node or nil.
        def end_date
          @end_date ||= respond_to?(:parliamentPeriodEndDate) ? DateTime.parse(parliamentPeriodEndDate) : nil
        end

        # Alias parliamentPeriodNumber with fallback.
        #
        # @return [Integer, nil] the incremented number of the parliament
        def number
          @number ||= respond_to?(:parliamentPeriodNumber) ? parliamentPeriodNumber.to_i : nil
        end

        # Checks whether ParliamentPeriod has a next Parliament
        #
        # @return [true, false]
        def next_parliament?
          respond_to?(:parliamentPeriodHasImmediatelyFollowingParliamentPeriod)
        end

        # Checks whether ParliamentPeriod has a previous Parliament
        #
        # @return [true, false]
        def previous_parliament?
          respond_to?(:parliamentPeriodHasImmediatelyPreviousParliamentPeriod)
        end
      end
    end
  end
end
