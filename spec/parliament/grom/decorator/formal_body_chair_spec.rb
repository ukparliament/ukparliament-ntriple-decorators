require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::FormalBodyChair, vcr: true do
  describe '#incumbencies' do
    before(:each) do
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).group_positions_chairs_index.get
      @formal_body_chair_nodes = response.filter('https://id.parliament.uk/schema/FormalBodyChair')
    end

    context 'Grom::Node has all the required objects' do
      it 'confirms that the type for this Grom::Node object is FormalBodyChair' do
        formal_body_chair = @formal_body_chair_nodes.first

        expect(formal_body_chair.type).to eq('https://id.parliament.uk/schema/FormalBodyChair')
      end

      it 'returns the incumbencies related to the Grom::Node object' do
        formal_body_chair = @formal_body_chair_nodes.first

        expect(formal_body_chair.incumbencies.first.type).to eq('https://id.parliament.uk/schema/Incumbency')
      end
    end

    context 'Grom::Node does not have have any incumbencies' do
      it 'confirms that incumbencies for this Grom::Node node do not exist' do
        formal_body_chair = @formal_body_chair_nodes[0]

        expect(formal_body_chair.incumbencies).to eq([])
      end
    end
  end
end
