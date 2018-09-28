module Parliament
  module Grom
    module Decorator
      # Decorator namespace for Grom::Node instances with type: https://id.parliament.uk/schema/ProposedNegativeStatutoryInstrumentPaper
      module ProposedNegativeStatutoryInstrumentPaper
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
