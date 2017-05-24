require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::ParliamentPeriod, vcr: true, focus: true do
  let(:response) do
    Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                        builder: Parliament::Builder::NTripleResponseBuilder,
                                        decorators: Parliament::Grom::Decorator).parliaments.get
  end

  before(:each) do
    @parliament_nodes = response.filter('http://id.ukpds.org/schema/ParliamentPeriod')
  end

  describe '#start_date' do
    context 'parliament has a start date' do
      it 'returns the start date of the parliament' do
        parliament_node = @parliament_nodes.first

        expect(parliament_node).to respond_to(:start_date)
        expect(parliament_node.start_date).to eq(DateTime.new(1801, 1, 22))
      end
    end

    context 'parliament has no start date' do
      it 'returns nil' do
        parliament_node = @parliament_nodes[1]

        expect(parliament_node).to respond_to(:start_date)
        expect(parliament_node.start_date).to be(nil)
      end
    end
  end

  describe '#end_date' do
    context 'parliament has an end date' do
      it 'returns the end date of the parliament' do
        parliament_node = @parliament_nodes.first

        expect(parliament_node).to respond_to(:end_date)
        expect(parliament_node.end_date).to eq(DateTime.new(1802, 6, 29))
      end
    end

    context 'parliament has no end date' do
      it 'returns nil' do
        parliament_node = @parliament_nodes[1]

        expect(parliament_node).to respond_to(:end_date)
        expect(parliament_node.end_date).to be(nil)
      end
    end
  end

  describe '#number' do
    context 'parliament has a number' do
      it 'returns the number of the parliament' do
        parliament_node = @parliament_nodes.first

        expect(parliament_node).to respond_to(:number)
        expect(parliament_node.number).to eq(1)
      end
    end

    context 'parliament has no number' do
      it 'returns nil' do
        parliament_node = @parliament_nodes[1]

        expect(parliament_node).to respond_to(:number)
        expect(parliament_node.number).to be(nil)
      end
    end
  end

  describe '#date_range' do
    context 'parliament has no start_date' do
      it 'returns no date' do
        parliament_node = @parliament_nodes.first

        expect(parliament_node).to respond_to(:date_range)
        expect(parliament_node.date_range(date_format: '%Y')).to eq('[Date unavailable]')
      end
    end

    context 'parliament has an end date' do
      it 'returns full formatted start and end date' do
        parliament_node = @parliament_nodes.first

        expect(parliament_node).to respond_to(:date_range)
        expect(parliament_node.date_range(date_format: '%Y')).to eq('1801 to 1802')
      end
    end

    context 'parliament has no end date' do
      it 'returns formatted start date' do
        parliament_node = @parliament_nodes.first

        expect(parliament_node).to respond_to(:date_range)
        expect(parliament_node.date_range(date_format: '%Y')).to eq('1801 to present')
      end
    end
  end

  describe '#next_parliament?' do
    let(:id) { 'GEFMX81E' }
    let(:response) do
      Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                          builder: Parliament::Builder::NTripleResponseBuilder,
                                          decorators: Parliament::Grom::Decorator).parliaments(id).get
    end

    before(:each) do
      @parliament_nodes = response.filter('http://id.ukpds.org/schema/ParliamentPeriod')
    end

    context 'parliament has a next parliament' do
      it 'returns the next parliament of the parliament' do
        parliament_node = @parliament_nodes.first

        expect(parliament_node).to respond_to(:next_parliament?)
        expect(parliament_node.next_parliament?).to eq(true)
      end
    end

    context 'parliament has no next parliament' do
      it 'returns nil' do
        parliament_node = @parliament_nodes[@parliament_nodes.count - 1]

        expect(parliament_node).to respond_to(:next_parliament?)
        expect(parliament_node.next_parliament?).to be(false)
      end
    end
  end

  describe '#previous_parliament?' do
    let(:id) { 'GEFMX81E' }
    let(:response) do
      Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                          builder: Parliament::Builder::NTripleResponseBuilder,
                                          decorators: Parliament::Grom::Decorator).parliaments(id).get
    end

    before(:each) do
      @parliament_nodes = response.filter('http://id.ukpds.org/schema/ParliamentPeriod')
    end

    context 'parliament has a previous parliament' do
      it 'returns the previous parliament of the parliament' do
        parliament_node = @parliament_nodes.first

        expect(parliament_node).to respond_to(:previous_parliament?)
        expect(parliament_node.previous_parliament?).to eq(true)
      end
    end

    context 'parliament has no previous parliament' do
      it 'returns nil' do
        parliament_node = @parliament_nodes[@parliament_nodes.count - 1]

        expect(parliament_node).to respond_to(:previous_parliament?)
        expect(parliament_node.previous_parliament?).to be(false)
      end
    end
  end
end
