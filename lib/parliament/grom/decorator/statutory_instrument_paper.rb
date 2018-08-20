module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/StatutoryInstrumentPage
      module StatutoryInstrumentPaper
        # Alias statutoryInstrumentPaperName with fallback.
        #
        # @return [String, String] the name of the Grom::Node or an empty string.
        def name
          respond_to?(:statutoryInstrumentPaperName) ? statutoryInstrumentPaperName : ''
        end

        # Alias statutoryInstrumentPaperPrefix with fallback.
        #
        # @return [String, String] the prefix of the Grom::Node or an empty string.
        def prefix
          respond_to?(:statutoryInstrumentPaperPrefix) ? statutoryInstrumentPaperPrefix : ''
        end

        # Alias statutoryInstrumentPaperYear with fallback.
        #
        # @return [String, String] the year of the Grom::Node or an empty string.
        def year
          respond_to?(:statutoryInstrumentPaperYear) ? statutoryInstrumentPaperYear : ''
        end

        # Alias statutoryInstrumentPaperNumber with fallback.
        #
        # @return [String, String] the number of the Grom::Node or an empty string.
        def number
          respond_to?(:statutoryInstrumentPaperNumber) ? statutoryInstrumentPaperNumber : ''
        end

        # Alias statutoryInstrumentPaperComingIntoForceDate with fallback.
        #
        # @return [Date, nil] the coming into force date of the Grom::Node or an empty string.
        def coming_into_force_date
          respond_to?(:statutoryInstrumentPaperComingIntoForceDate) ? DateTime.parse(statutoryInstrumentPaperComingIntoForceDate) : nil
        end

        # Alias statutoryInstrumentPaperComingIntoForceNote with fallback.
        #
        # @return [String, String] the coming into force date of the Grom::Node or an empty string.
        def coming_into_force_note
          respond_to?(:statutoryInstrumentPaperComingIntoForceNote) ? statutoryInstrumentPaperComingIntoForceNote : ''
        end

        # Alias workPackagedThingHasWorkPackagedThingWebLink with fallback.
        #
        # @return [String, String] a web link to view the statutory instrument Grom::Node or an empty string.
        def weblink
          respond_to?(:workPackagedThingHasWorkPackagedThingWebLink) ? workPackagedThingHasWorkPackagedThingWebLink : ''
        end

        # Alias workPackagedThingHasWorkPackage with fallback.
        #
        # @return [Grom::Node, nil] a work package Grom::Node or an empty string.
        def work_package
          respond_to?(:workPackagedThingHasWorkPackage) ? workPackagedThingHasWorkPackage.first : nil
        end
      end
    end
  end
end
