require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::LaidThing, vcr: true do
  before(:each) do
    response = Parliament::Request::UrlRequest.new(
        base_url: 'http://localhost:3030/api/v1',
        builder: Parliament::Builder::NTripleResponseBuilder,
        decorators: Parliament::Grom::Decorator).statutory_instrument_by_id.get

    @laid_thing = response.filter('https://id.parliament.uk/schema/LaidThing').first
  end

  describe '#laying' do
    context 'Grom::Node has a laying' do
      it 'returns a laying Grom::Node' do
        expect(@laid_thing.laying.type).to eq('https://id.parliament.uk/schema/Laying')
      end
    end

    context 'Grom::Node does not have a laying' do
      it 'returns nil' do
        expect(@laid_thing.laying).to eq(nil)
      end
    end
  end
end
