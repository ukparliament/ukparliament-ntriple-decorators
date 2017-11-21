require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::OppositionPosition, vcr: true do
  before(:each) do
    id = 'soTeywda'
    response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3000/api/v1',
    builder: Parliament::Builder::NTripleResponseBuilder,
    decorators: Parliament::Grom::Decorator).person_by_id.get
    @opposition_position_nodes = response.filter('https://id.parliament.uk/schema/OppositionPosition')
  end

  context '#name' do
    context 'Grom::Node has a name' do
      it 'will return correct name' do
        expect(@opposition_position_nodes[0].name).to eq('Opposition Role 1')
      end
    end

    context 'Grom::Node has no name' do
      it 'will return empty string' do
        expect(@opposition_position_nodes[0].name).to eq('')
      end
    end
  end
end
