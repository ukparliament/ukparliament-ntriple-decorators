module Parliament
  module Grom
    module Decorator
      module Helpers
        # Namespace for date helper methods
        module DateHelper
          # Format start_date and end_date into a readable string
          #
          # @param [String] date_format a string that represents the format we want to use for the date
          #
          # @example Format a node with an end_date with the date format YYYY-MM-DD
          #   "grom_node_instance.date_range('%Y-%m-%d)" #=> "2010-01-01 to 2015-01-01"
          #
          # @return [String] formatted date range
          def date_range(date_format: '%-d %-B %Y')
            return I18n.t('date_unavailable') if start_date.nil?

            if end_date
              "#{I18n.l(start_date, format: date_format)} #{I18n.t('to')} #{I18n.l(end_date, format: date_format)}"
            else
              "#{I18n.l(start_date, format: date_format)} #{I18n.t('to_present')}"
            end
          end
        end
      end
    end
  end
end
