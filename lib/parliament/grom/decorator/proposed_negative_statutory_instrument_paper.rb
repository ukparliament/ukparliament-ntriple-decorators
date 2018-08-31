module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/ProposedNegativeStatutoryInstrumentPaper
      module ProposedNegativeStatutoryInstrumentPaper
        # Alias proposedNegativeStatutoryInstrumentPaperName with fallback.
        #
        # @return [String, String] the name of the Grom::Node or an empty string.
        def name
          respond_to?(:proposedNegativeStatutoryInstrumentPaperName) ? proposedNegativeStatutoryInstrumentPaperName : ''
        end

        # Alias proposedNegativeStatutoryInstrumentPaperPrecedesStatutoryInstrumentPaper with fallback.
        #
        # @return [Array, Array] an array of StatutoryInstrumentPaper Grom::Nodes or an empty array.
        def statutory_instrument_papers
          respond_to?(:proposedNegativeStatutoryInstrumentPaperPrecedesStatutoryInstrumentPaper) ? proposedNegativeStatutoryInstrumentPaperPrecedesStatutoryInstrumentPaper : []
        end
      end
    end
  end
end
