require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::StatutoryInstrumentPaper, vcr: true do
  before(:each) do
    response = Parliament::Request::UrlRequest.new(
        base_url: 'http://localhost:3030/api/v1',
        builder: Parliament::Builder::NTripleResponseBuilder,
        decorators: Parliament::Grom::Decorator).statutory_instrument_by_id.get

    @statutory_instrument_paper = response.filter('https://id.parliament.uk/schema/StatutoryInstrumentPaper').first
  end

  describe '#made_date' do
    context 'Grom::Node has a made date' do
      it 'returns the made date of the Grom::Node object' do
        expect(@statutory_instrument_paper.made_date).to eq(DateTime.new(2018,07,01,0,0,0))
      end
    end

    context 'Grom::Node does not have a made date' do
      it 'returns nil' do
        expect(@statutory_instrument_paper.made_date).to eq(nil)
      end
    end
  end

  describe '#coming_into_force_date' do
    context 'Grom::Node has a coming into force date' do
      it 'returns the coming into force date of the Grom::Node object' do
        expect(@statutory_instrument_paper.coming_into_force_date).to eq(DateTime.new(2018,06,01,0,0,0))
      end
    end

    context 'Grom::Node does not have a coming into force date' do
      it 'returns nil' do
        expect(@statutory_instrument_paper.coming_into_force_date).to eq(nil)
      end
    end
  end

  describe '#proposed_negative_statutory_instrument_papers' do
    context 'Grom::Node has a set of proposed negative statutory instrument papers' do
      it 'returns an array of Grom::Nodes for the Grom::Node object' do
        expect(@statutory_instrument_paper.proposed_negative_statutory_instrument_papers.size).to eq(2)
      end

      it 'returns an array of proposed negative statutory instrument papers Grom::Nodes for the Grom::Node object' do
        expect(@statutory_instrument_paper.proposed_negative_statutory_instrument_papers.first.type).to include('https://id.parliament.uk/schema/ProposedNegativeStatutoryInstrumentPaper')
      end
    end

    context 'Grom::Node does not have any proposed negative statutory instrument papers' do
      it 'returns an empty array' do
        expect(@statutory_instrument_paper.proposed_negative_statutory_instrument_papers).to eq([])
      end
    end
  end
end