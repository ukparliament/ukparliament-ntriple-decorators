module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/StatutoryInstrumentPaper
      module StatutoryInstrumentPaper
        # Alias statutoryInstrumentPaperMadeDate with fallback.
        #
        # @return [Date, nil] the coming into force date of the Grom::Node or nil.
        def made_date
          respond_to?(:statutoryInstrumentPaperMadeDate) ? DateTime.parse(statutoryInstrumentPaperMadeDate) : nil
        end

        # Alias Date with fallback.
        #
        # @return [Date, nil] the coming into force date of the Grom::Node or nil.
        def coming_into_force_date
          respond_to?(:statutoryInstrumentPaperComingIntoForceDate) ? DateTime.parse(statutoryInstrumentPaperComingIntoForceDate) : nil
        end

        # Alias statutoryInstrumentPaperFollowsProposedNegativeStatutoryInstrumentPaper with fallback.
        #
        # @return [Array, Array] an array of ProposedNegativeStatutoryInstrumentPaper Grom::Nodes or an empty array.
        def proposed_negative_statutory_instrument_papers
          respond_to?(:statutoryInstrumentPaperFollowsProposedNegativeStatutoryInstrumentPaper) ? statutoryInstrumentPaperFollowsProposedNegativeStatutoryInstrumentPaper : []
        end
      end
    end
  end
end
