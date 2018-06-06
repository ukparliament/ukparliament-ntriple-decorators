require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::Incumbency, vcr: true do
  before(:each) do
    response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
    builder: Parliament::Builder::NTripleResponseBuilder,
    decorators: Parliament::Grom::Decorator).group_positions_index.get
    @incumbency_nodes = response.filter('https://id.parliament.uk/schema/Incumbency')
  end

  context '#start_date' do
    context 'Grom::Node has a start date' do
      it 'will return correct start date' do
        expect(@incumbency_nodes[0].start_date).to eq(DateTime.parse('2010-06-09T00:00:00+00:00'))
        expect(@incumbency_nodes[0].start_date.class).to eq(DateTime)
      end
    end

    context 'Grom::Node has no start date' do
      it 'will return nil' do
        expect(@incumbency_nodes[0].start_date).to eq(nil)
      end
    end
  end

  context '#end_date' do
    context 'Grom::Node has an end date' do
      it 'will return correct end date' do
        expect(@incumbency_nodes[0].end_date).to eq(DateTime.parse('2012-05-08T00:00:00+00:00'))
        expect(@incumbency_nodes[0].end_date.class).to eq(DateTime)
      end
    end

    context 'Grom::Node has no end date' do
      it 'will return nil' do
        expect(@incumbency_nodes[0].end_date).to eq(nil)
      end
    end
  end

  context '#current?' do
    context 'is current' do
      it 'will return true' do
        expect(@incumbency_nodes[0].current?).to eq(true)
      end
    end

    context 'is not current' do
      it 'will return false' do
        expect(@incumbency_nodes[0].current?).to eq(false)
      end
    end
  end

  describe '#date_range' do
    context 'incumbency has no start_date' do
      it 'returns no date' do
        incumbency_node = @incumbency_nodes.first

        expect(incumbency_node).to respond_to(:date_range)
        expect(incumbency_node.date_range).to eq('[Date unavailable]')
      end
    end

    context 'incumbency has an end date' do
      it 'returns full formatted start and end date' do
        incumbency_node = @incumbency_nodes.first

        expect(incumbency_node).to respond_to(:date_range)
        expect(incumbency_node.date_range).to eq('9 June 2010 to 8 May 2012')
      end
    end

    context 'incumbency has no end date' do
      it 'returns formatted start date' do
        incumbency_node = @incumbency_nodes.first

        expect(incumbency_node).to respond_to(:date_range)
        expect(incumbency_node.date_range).to eq('9 June 2010 to present')
      end
    end
  end
end
