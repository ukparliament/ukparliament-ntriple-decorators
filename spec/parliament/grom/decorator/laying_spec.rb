require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::Laying, vcr: true do
  before(:each) do
    response = Parliament::Request::UrlRequest.new(
        base_url: 'http://localhost:3030/api/v1',
        builder: Parliament::Builder::NTripleResponseBuilder,
        decorators: Parliament::Grom::Decorator).laying_by_id.get

    @laying = response.filter('https://id.parliament.uk/schema/Laying').first
  end

  describe '#date' do
    context 'Grom::Node has a date' do
      it 'returns the date of the Grom::Node object' do
        expect(@laying.date).to eq(DateTime.new(2018,06,01,0,0,0))
      end
    end

    context 'Grom::Node does not have a date' do
      it 'returns nil' do
        expect(@laying.date).to eq(nil)
      end
    end
  end

  describe '#laying_body' do
    context 'Grom::Node has a laying body' do
      it 'returns the laying body of the Grom::Node object' do
        expect(@laying.laying_body.type).to eq('https://id.parliament.uk/schema/LayingBody')
      end
    end

    context 'Grom::Node does not have a laying body' do
      it 'returns nil' do
        expect(@laying.laying_body).to eq(nil)
      end
    end
  end
end
