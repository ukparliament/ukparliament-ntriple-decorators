require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::Position, vcr: true do
  before(:each) do
    response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                   builder: Parliament::Builder::NTripleResponseBuilder,
                                                   decorators: Parliament::Grom::Decorator).group_positions_index.get
    @position_nodes = response.filter('https://id.parliament.uk/schema/Position')
  end
  describe '#incumbencies' do
    context 'Grom::Node has all the required objects' do
      it 'confirms that the type for this Grom::Node object is Position' do
        position = @position_nodes.first

        expect(position.type).to eq('https://id.parliament.uk/schema/Position')
      end

      it 'returns the incumbencies related to the Grom::Node object' do
        position = @position_nodes.first

        expect(position.incumbencies.first.type).to eq('https://id.parliament.uk/schema/Incumbency')
      end
    end

    context 'Grom::Node does not have have any incumbencies' do
      it 'confirms that incumbencies for this Grom::Node node do not exist' do
        position = @position_nodes[0]

        expect(position.incumbencies).to eq([])
      end
    end
  end

  describe '#name' do
    context 'Grom::Node has all the required objects' do
      it 'confirms that the type for this Grom::Node object is ' do
        position = @position_nodes.first

        expect(position.type).to eq('https://id.parliament.uk/schema/Position')
      end

      it 'returns the name of the Grom::Node object' do
        position = @position_nodes.first

        expect(position.name).to eq('Chair')
      end
    end
  end
end
