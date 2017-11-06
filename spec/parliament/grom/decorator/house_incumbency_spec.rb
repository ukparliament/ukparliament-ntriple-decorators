require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::HouseIncumbency, vcr: true do
  let(:id) { '90558d1f-ea34-4c44-b3ad-ed9c98a557d1' }
  let(:response) do
    Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                        builder: Parliament::Builder::NTripleResponseBuilder,
                                        decorators: Parliament::Grom::Decorator).people(id).get
  end

  before(:each) do
    @incumbency_nodes = response.filter('https://id.parliament.uk/schema/HouseIncumbency')
  end

  describe '#start_date' do
    context 'house incumbency has a start date' do
      it 'returns the start date of the house incumbency' do
        incumbency_node = @incumbency_nodes.first

        expect(incumbency_node).to respond_to(:start_date)
        expect(incumbency_node.start_date).to eq(DateTime.new(1992, 6, 26))
      end
    end

    context 'house incumbency has no start date' do
      it 'returns nil' do
        incumbency_node = @incumbency_nodes[0]

        expect(incumbency_node).to respond_to(:start_date)
        expect(incumbency_node.start_date).to be(nil)
      end
    end
  end

  describe '#end_date' do
    context 'house incumbency has an end date' do
      it 'returns the end date of the house incumbency' do
        incumbency_node = @incumbency_nodes.first

        expect(incumbency_node).to respond_to(:end_date)
        expect(incumbency_node.end_date).to eq(DateTime.new(2013, 4, 8))
      end
    end

    context 'house incumbency has no end date' do
      it 'returns nil' do
        incumbency_node = @incumbency_nodes[0]

        expect(incumbency_node).to respond_to(:end_date)
        expect(incumbency_node.end_date).to be(nil)
      end
    end
  end

  describe '#house' do
    context 'Grom::Node has all the required objects' do
      it 'returns the house for a Grom::Node object of type HouseIncumbency' do
        incumbency_node = @incumbency_nodes.first

        expect(incumbency_node.house.type).to eq('https://id.parliament.uk/schema/House')
      end
    end

    context 'Grom::Node has no house' do
      it 'returns nil' do
        incumbency_node = @incumbency_nodes[0]

        expect(incumbency_node.house).to be(nil)
      end
    end
  end

  describe '#member' do
    context 'Grom::Node has all the required objects' do
      it 'returns the member for a Grom::Node object of type HouseIncumbency' do
        incumbency_node = @incumbency_nodes.first

        expect(incumbency_node.member.type).to eq('https://id.parliament.uk/schema/Person')
      end
    end

    context 'Grom::Node has no member' do
      it 'returns nil' do
        incumbency_node = @incumbency_nodes[0]

        expect(incumbency_node.member).to be_nil
      end
    end
  end

  describe '#current?' do
    it 'Grom::Node returns the correct value for a current or non current house incumbency' do
      incumbency_results = @incumbency_nodes.map(&:current?)

      expect(incumbency_results).to eq([false, true])
    end
  end

  describe '#contact_points' do
    context 'house incumbency has contact points' do
      it 'returns an array of contact points' do
        incumbency_node = response.filter('https://id.parliament.uk/schema/HouseIncumbency')[0]

        expect(incumbency_node).to respond_to(:contact_points)
        expect(incumbency_node.contact_points.size).to eq 1
        expect(incumbency_node.contact_points.first.type).to eq 'https://id.parliament.uk/schema/ContactPoint'
      end
    end

    context 'house incumbency has no contact points' do
      it 'returns an empty array' do
        incumbency_node = response.filter('https://id.parliament.uk/schema/HouseIncumbency').first

        expect(incumbency_node).to respond_to(:contact_points)
        expect(incumbency_node.contact_points).to eq []
      end
    end
  end

  describe '#date_range' do
    include_examples 'date range has no start date' do
      let(:node) { response.filter('https://id.parliament.uk/schema/HouseIncumbency').first }
    end

    include_examples 'date range has no end date' do
      let(:node) { response.filter('https://id.parliament.uk/schema/HouseIncumbency').first }
    end

    include_examples 'date range has start and end dates' do
      let(:node) { response.filter('https://id.parliament.uk/schema/HouseIncumbency').first }
    end
  end
end
