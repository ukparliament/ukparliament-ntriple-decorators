require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::HouseSeat, vcr: true do
  let(:response) do
    Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                        builder: Parliament::Builder::NTripleResponseBuilder,
                                        decorators: Parliament::Grom::Decorator).people('7c511a2b-9ce2-4001-8ee5-71ae734c52d6').get
  end

  before(:each) do
    @seat_nodes = response.filter('https://id.parliament.uk/schema/HouseSeat')
  end

  describe '#house' do
    context 'Grom::Node has all the required objects' do
      it 'returns the house for a Grom::Node object of type HouseSeat' do
        seat_node = @seat_nodes.first

        expect(seat_node.house.type).to eq('https://id.parliament.uk/schema/House')
      end
    end

    context 'Grom::Node has no house' do
      it 'returns nil' do
        seat_node = @seat_nodes[0]

        expect(seat_node.house).to be(nil)
      end
    end
  end

  describe '#constituency' do
    context 'Grom::Node has all the required objects' do
      it 'returns the constituency for a Grom::Node object of type HouseSeat' do
        seat_node = @seat_nodes.first

        expect(seat_node.constituency.type).to eq('https://id.parliament.uk/schema/ConstituencyGroup')
      end
    end

    context 'Grom::Node has no constituency' do
      it 'returns nil' do
        seat_node = @seat_nodes[0]

        expect(seat_node.constituency).to be(nil)
      end
    end
  end

  describe '#seat_incumbencies' do
    before(:each) do
      @seat_nodes = response.filter('https://id.parliament.uk/schema/HouseSeat')
    end

    context 'Grom::Node has all the required objects' do
      it 'returns the seat incumbencies for a Grom::Node object of type HouseSeat' do
        seat_node = @seat_nodes.first

        expect(seat_node.seat_incumbencies.size).to eq(1)
        expect(seat_node.seat_incumbencies.first.type).to eq('https://id.parliament.uk/schema/SeatIncumbency')
      end
    end

    context 'Grom::Node has no seat incumbencies' do
      it 'returns an empty array' do
        seat_node = @seat_nodes[0]

        expect(seat_node.seat_incumbencies).to eq([])
      end
    end
  end
end
