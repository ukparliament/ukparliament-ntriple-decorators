require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::FormalBodyType, vcr: true do
  describe '#name' do
    before(:each) do
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).formal_body_by_id.get
      @formal_body_type_nodes = response.filter('https://id.parliament.uk/schema/FormalBodyType')
    end

    context 'Grom::Node has all the required objects' do
      it 'confirms that the correct type for this Grom::Node object is FormalBodyType' do
        formal_body_type = @formal_body_type_nodes.first
        expect(formal_body_type.type).to eq('https://id.parliament.uk/schema/FormalBodyType')
      end

      it 'returns the type of formal body related to the Grom::Node object' do
        formal_body_type = @formal_body_type_nodes.first
        expect(formal_body_type.name).to eq('Parliamentary - Select')
      end

      it 'does not return the type of formal body related to the Grom::Node object' do
        formal_body_type = @formal_body_type_nodes.first
        expect(formal_body_type.name).to eq('')
      end
    end
    
  end
end