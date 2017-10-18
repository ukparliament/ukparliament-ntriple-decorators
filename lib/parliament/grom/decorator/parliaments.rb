module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/Parliaments
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

        # Checks if Grom::Node is current - ie. it has a start date in the past or today and an end date which is nil, today or in the future.
        #
        # @return [Boolean] a boolean depending on whether or not the Grom::Node is current.
        def current?
          (!start_date.nil? && start_date <= Date.today) && (end_date.nil? || end_date >= Date.today)
        end
      end
    end
  end
end
