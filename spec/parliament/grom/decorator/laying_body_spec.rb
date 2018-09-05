require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::LayingBody, vcr: true do
  before(:each) do
    response = Parliament::Request::UrlRequest.new(
        base_url: 'http://localhost:3030/api/v1',
        builder: Parliament::Builder::NTripleResponseBuilder,
        decorators: Parliament::Grom::Decorator).laying_body_by_id.get

    @laying_body = response.filter('https://id.parliament.uk/schema/LayingBody').first
  end

  describe '#name' do
    context 'Grom::Node has a name' do
      it 'returns the name of the Grom::Node object' do
        expect(@laying_body.name).to eq('Some laying body name')
      end
    end

    context 'Grom::Node does not have a name' do
      it 'returns an empty string' do
        expect(@laying_body.name).to eq('')
      end
    end
  end
end
