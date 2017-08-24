require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::FormalBody, vcr: true do
  before(:each) do
    id = 'tJxPOiSd'
    response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3000',
    builder: Parliament::Builder::NTripleResponseBuilder,
    decorators: Parliament::Grom::Decorator).people(id).get
    @formal_body_nodes = response.filter('http://id.ukpds.org/schema/FormalBody')
  end

  context '#name' do
    context 'Grom::Node has a name' do
      it 'will return correct name' do
        expect(@formal_body_nodes[0].name).to eq('Trade Committee')
      end
    end

    context 'Grom::Node has no name' do
      it 'will return an empty string' do
        expect(@formal_body_nodes[1].name).to eq('')
      end
    end
  end
end
