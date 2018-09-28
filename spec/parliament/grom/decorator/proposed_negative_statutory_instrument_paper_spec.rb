
require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::ProposedNegativeStatutoryInstrumentPaper, vcr: true do
    let(:response) do
      Parliament::Request::UrlRequest.new(
        base_url: 'http://localhost:3030/api/v1',
        builder: Parliament::Builder::NTripleResponseBuilder,
        decorators: Parliament::Grom::Decorator).proposed_negative_statutory_instrument_by_id.get
    end

    let(:proposed_neg_statutory_instrument_paper) { response.filter('https://id.parliament.uk/schema/ProposedNegativeStatutoryInstrumentPaper').first }

  describe '#statutory_instrument_papers' do
    context 'Grom::Node has a set of statutory instrument papers' do
      it 'returns an array of Grom::Nodes for the Grom::Node object' do
        expect(proposed_neg_statutory_instrument_paper.statutory_instrument_papers.size).to eq(2)
      end

      it 'returns an array of statutory instrument papers Grom::Nodes for the Grom::Node object' do
        expect(proposed_neg_statutory_instrument_paper.statutory_instrument_papers.first.type).to include('https://id.parliament.uk/schema/StatutoryInstrumentPaper')
      end
    end

    context 'Grom::Node does not have any statutory instrument papers' do
      it 'returns an empty array' do
        expect(proposed_neg_statutory_instrument_paper.statutory_instrument_papers).to eq([])
      end
    end
  end
end