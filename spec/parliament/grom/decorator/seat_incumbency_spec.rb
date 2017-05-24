require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::SeatIncumbency, vcr: true do
  let(:id) { '1921fc4a-6867-48fa-a4f4-6df05be005ce' }
  let(:response) do
    Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                        builder: Parliament::Builder::NTripleResponseBuilder,
                                        decorators: Parliament::Grom::Decorator).people(id).get
  end

  before(:each) do
    @seat_incumbency_nodes = response.filter('http://id.ukpds.org/schema/SeatIncumbency')
  end

  describe '#start_date' do
    context 'seat incumbency has a start date' do
      it 'returns the start date of the seat incumbency' do
        seat_incumbency_node = @seat_incumbency_nodes.first

        expect(seat_incumbency_node).to respond_to(:start_date)
        expect(seat_incumbency_node.start_date).to eq(DateTime.new(1987, 6, 11))
      end
    end

    context 'seat incumbency has no start date' do
      it 'returns nil' do
        seat_incumbency_node = @seat_incumbency_nodes[1]

        expect(seat_incumbency_node).to respond_to(:start_date)
        expect(seat_incumbency_node.start_date).to be(nil)
      end
    end
  end

  describe '#end_date' do
    context 'seat incumbency has an end date' do
      it 'returns the end date of the seat incumbency' do
        seat_incumbency_node = @seat_incumbency_nodes.first

        expect(seat_incumbency_node).to respond_to(:end_date)
        expect(seat_incumbency_node.end_date).to eq(DateTime.new(1992, 4, 9))
      end
    end

    context 'seat incumbency has no end date' do
      it 'returns nil' do
        seat_incumbency_node = @seat_incumbency_nodes[1]

        expect(seat_incumbency_node).to respond_to(:end_date)
        expect(seat_incumbency_node.end_date).to be(nil)
      end
    end
  end

  describe '#date_range' do
    context 'seat incumbency has no start_date' do
      it 'returns no date' do
        seat_incumbency_node = @seat_incumbency_nodes.first

        expect(seat_incumbency_node).to respond_to(:date_range)
        expect(seat_incumbency_node.date_range).to eq('[Date unavailable]')
      end
    end

    context 'seat incumbency has an end date' do
      it 'returns full formatted start and end date' do
        seat_incumbency_node = @seat_incumbency_nodes.first

        expect(seat_incumbency_node).to respond_to(:date_range)
        expect(seat_incumbency_node.date_range).to eq('11 Jun 1987 to 9 Apr 1992')
      end
    end

    context 'seat incumbency has no end date' do
      it 'returns formatted start date' do
        seat_incumbency_node = @seat_incumbency_nodes.first

        expect(seat_incumbency_node).to respond_to(:date_range)
        expect(seat_incumbency_node.date_range).to eq('11 Jun 1987 to present')
      end
    end
  end

  describe '#seat' do
    context 'Grom::Node has all the required objects' do
      it 'returns the seat for a Grom::Node object of type SeatIncumbency' do
        seat_incumbency_node = @seat_incumbency_nodes.first

        expect(seat_incumbency_node.seat.type).to eq('http://id.ukpds.org/schema/HouseSeat')
      end
    end

    context 'Grom::Node has no seats' do
      it 'returns an empty array' do
        seat_incumbency_node = @seat_incumbency_nodes[1]

        expect(seat_incumbency_node.seat).to be(nil)
      end
    end
  end

  describe '#house' do
    context 'Grom::Node has all the required objects' do
      it 'returns the house for a Grom::Node object of type SeatIncumbency' do
        seat_incumbency_node = @seat_incumbency_nodes.first

        expect(seat_incumbency_node.house.type).to eq('http://id.ukpds.org/schema/House')
      end
    end

    context 'Grom::Node has no house' do
      it 'returns nil' do
        seat_incumbency_node = @seat_incumbency_nodes[1]

        expect(seat_incumbency_node.house).to be(nil)
      end
    end
  end

  describe '#constituency' do
    context 'Grom::Node has all the required objects' do
      it 'returns the constituency for a Grom::Node object of type SeatIncumbency' do
        seat_incumbency_node = @seat_incumbency_nodes.first

        expect(seat_incumbency_node.constituency.type).to eq('http://id.ukpds.org/schema/ConstituencyGroup')
      end
    end

    context 'Grom::Node has no constituency' do
      it 'returns nil' do
        seat_incumbency_node = @seat_incumbency_nodes[1]

        expect(seat_incumbency_node.constituency).to be(nil)
      end
    end
  end

  describe '#current?' do
    it 'Grom::Node returns the correct value for a current or former seat incumbency' do
      seat_incumbency_results = @seat_incumbency_nodes.map(&:current?)

      expect(seat_incumbency_results).to eq([false, false, false, false, false, false, true])
    end
  end

  describe '#former?' do
    it 'Grom::Node returns the correct value for a former or current seat incumbency' do
      seat_incumbency_results = @seat_incumbency_nodes.map(&:former?)

      expect(seat_incumbency_results).to eq([true, true, true, true, true, true, false])
    end
  end

  describe '#contact_points' do
    context 'seat incumbency has contact points' do
      it 'returns an array of contact points' do
        seat_incumbency_node = response.filter('http://id.ukpds.org/schema/SeatIncumbency')[5]

        expect(seat_incumbency_node).to respond_to(:contact_points)
        expect(seat_incumbency_node.contact_points.size).to eq 1
        expect(seat_incumbency_node.contact_points.first.type).to eq 'http://id.ukpds.org/schema/ContactPoint'
      end
    end

    context 'seat incumbency has no contact points' do
      it 'returns an empty array' do
        seat_incumbency_node = response.filter('http://id.ukpds.org/schema/SeatIncumbency').first

        expect(seat_incumbency_node).to respond_to(:contact_points)
        expect(seat_incumbency_node.contact_points).to eq []
      end
    end
  end

  describe '#member' do
    context 'Grom::Node has all the required objects' do
      it 'returns the member for a Grom::Node object of type SeatIncumbency' do
        seat_incumbency_node = @seat_incumbency_nodes.first

        expect(seat_incumbency_node.member.type).to eq('http://id.ukpds.org/schema/Person')
      end
    end

    context 'Grom::Node has no member' do
      it 'returns nil' do
        seat_incumbency_node = @seat_incumbency_nodes[1]

        expect(seat_incumbency_node.member).to be_nil
      end
    end
  end
end
