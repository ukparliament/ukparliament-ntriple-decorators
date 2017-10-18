require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::ParliamentaryIncumbency, vcr: true do
  let(:id) { '4b77dd58-f6ba-4121-b521-c8ad70465f52' }
  let(:response) do
    Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                        builder: Parliament::Builder::NTripleResponseBuilder,
                                        decorators: Parliament::Grom::Decorator).houses(id).members.current.get
  end

  before(:each) do
    @parliamentary_incumbency_nodes = response.filter('https://id.parliament.uk/schema/ParliamentaryIncumbency')
  end

  describe '#start_date' do
    context 'incumbency has a start date' do
      it 'returns the start date of the incumbency' do
        incumbency_node = @parliamentary_incumbency_nodes.first

        expect(incumbency_node).to respond_to(:start_date)
        expect(incumbency_node.start_date).to eq(DateTime.new(2015, 5, 7))
      end
    end

    context 'incumbency has no start date' do
      it 'returns nil' do
        incumbency_node = @parliamentary_incumbency_nodes[1]

        expect(incumbency_node).to respond_to(:start_date)
        expect(incumbency_node.start_date).to be(nil)
      end
    end
  end

  describe '#end_date' do
    context 'incumbency has an end date' do
      it 'returns the end date of the incumbency' do
        incumbency_node = @parliamentary_incumbency_nodes.first

        expect(incumbency_node).to respond_to(:end_date)
        expect(incumbency_node.end_date).to eq(DateTime.new(2016, 5, 7))
      end
    end

    context 'incumbency has no end date' do
      it 'returns nil' do
        incumbency_node = @parliamentary_incumbency_nodes[1]

        expect(incumbency_node).to respond_to(:end_date)
        expect(incumbency_node.end_date).to be(nil)
      end
    end
  end

  describe '#date_range' do
    context 'incumbency has no start_date' do
      it 'returns no date' do
        incumbency_node = @parliamentary_incumbency_nodes.first

        expect(incumbency_node).to respond_to(:date_range)
        expect(incumbency_node.date_range).to eq('[Date unavailable]')
      end
    end

    context 'incumbency has an end date' do
      it 'returns full formatted start and end date' do
        incumbency_node = @parliamentary_incumbency_nodes.first

        expect(incumbency_node).to respond_to(:date_range)
        expect(incumbency_node.date_range).to eq('7 May 2015 to 7 May 2016')
      end
    end

    context 'incumbency has no end date' do
      it 'returns formatted start date' do
        incumbency_node = @parliamentary_incumbency_nodes.first

        expect(incumbency_node).to respond_to(:date_range)
        expect(incumbency_node.date_range).to eq('7 May 2015 to present')
      end
    end
  end

  describe '#member' do
    context 'Grom::Node has all the required objects' do
      it 'returns the member for a Grom::Node object of type ParliamentaryIncumbency' do
        incumbency_node = @parliamentary_incumbency_nodes.first

        expect(incumbency_node.member.type).to eq('https://id.parliament.uk/schema/Person')
      end
    end

    context 'Grom::Node has no member' do
      it 'returns nil' do
        incumbency_node = @parliamentary_incumbency_nodes[1]

        expect(incumbency_node.member).to be_nil
      end
    end
  end

  describe '#current?' do
    it 'Grom::Node returns the correct value for a current or non current incumbency' do
      incumbency_results = @parliamentary_incumbency_nodes.map(&:current?)

      expect(incumbency_results).to eq([false, true, true])
    end
  end

  describe '#contact_points' do
    context 'incumbency has contact points' do
      it 'returns an array of contact points' do
        incumbency_node = response.filter('https://id.parliament.uk/schema/ParliamentaryIncumbency')[0]

        expect(incumbency_node).to respond_to(:contact_points)
        expect(incumbency_node.contact_points.size).to eq 1
        expect(incumbency_node.contact_points.first.type).to eq 'https://id.parliament.uk/schema/ContactPoint'
      end
    end

    context 'incumbency has no contact points' do
      it 'returns an empty array' do
        incumbency_node = response.filter('https://id.parliament.uk/schema/ParliamentaryIncumbency').first

        expect(incumbency_node).to respond_to(:contact_points)
        expect(incumbency_node.contact_points).to eq []
      end
    end
  end

  describe '#house' do
    context 'Grom::Node has all the required objects' do
      it 'returns the house for a Grom::Node object of type ParliamentaryIncumbency' do
        incumbency_node = @parliamentary_incumbency_nodes.first

        expect(incumbency_node.house.type).to eq('https://id.parliament.uk/schema/House')
      end
    end

    context 'Grom::Node has no house' do
      it 'returns nil' do
        incumbency_node = @parliamentary_incumbency_nodes.first

        expect(incumbency_node.house).to be(nil)
      end
    end
  end

  describe '#seat' do
    context 'Grom::Node has all the required objects' do
      it 'returns the seat for a Grom::Node object of type ParliamentaryIncumbency' do
        incumbency_node = @parliamentary_incumbency_nodes.first

        expect(incumbency_node.seat.type).to eq('https://id.parliament.uk/schema/HouseSeat')
      end
    end

    context 'Grom::Node has no seats' do
      it 'returns nil' do
        incumbency_node = @parliamentary_incumbency_nodes.first

        expect(incumbency_node.seat).to be(nil)
      end
    end
  end
end
