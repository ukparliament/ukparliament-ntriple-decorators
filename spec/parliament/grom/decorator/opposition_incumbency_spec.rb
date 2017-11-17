require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::OppositionIncumbency, vcr: true do
  before(:each) do
    id = 'soTeywda'
    response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3000/api/v1',
    builder: Parliament::Builder::NTripleResponseBuilder,
    decorators: Parliament::Grom::Decorator).person_by_id.get
    @opposition_incumbency_nodes = response.filter('https://id.parliament.uk/schema/OppositionIncumbency')
  end

  context '#start_date' do
    context 'Grom::Node has a start date' do
      it 'will return correct start date' do
        expect(@opposition_incumbency_nodes[0].start_date).to eq(DateTime.parse('2016-07-13T00:00:00+00:00'))
        expect(@opposition_incumbency_nodes[0].start_date.class).to eq(DateTime)
      end
    end

    context 'Grom::Node has no start date' do
      it 'will return nil' do
        expect(@opposition_incumbency_nodes[0].start_date).to eq(nil)
      end
    end
  end

  context '#end_date' do
    context 'Grom::Node has an end date' do
      it 'will return correct end date' do
        expect(@opposition_incumbency_nodes[1].end_date).to eq(DateTime.parse('2012-11-02T00:00:00+00:00'))
        expect(@opposition_incumbency_nodes[1].end_date.class).to eq(DateTime)
      end
    end

    context 'Grom::Node has no end date' do
      it 'will return nil' do
        expect(@opposition_incumbency_nodes[0].end_date).to eq(nil)
      end
    end
  end

  context '#current?' do
    context 'is current' do
      it 'will return true' do
        expect(@opposition_incumbency_nodes[0].current?).to eq(true)
      end
    end

    context 'is not current' do
      it 'will return false' do
        expect(@opposition_incumbency_nodes[1].current?).to eq(false)
      end
    end
  end

  describe '#date_range' do
    context 'opposition incumbency has no start_date' do
      it 'returns no date' do
        opposition_incumbency_node = @opposition_incumbency_nodes.first

        expect(opposition_incumbency_node).to respond_to(:date_range)
        expect(opposition_incumbency_node.date_range).to eq('[Date unavailable]')
      end
    end

    context 'opposition incumbency has an end date' do
      it 'returns full formatted start and end date' do
        opposition_incumbency_node = @opposition_incumbency_nodes.first

        expect(opposition_incumbency_node).to respond_to(:date_range)
        expect(opposition_incumbency_node.date_range).to eq('13 Jul 2016 to 19 Jan 2017')
      end
    end

    context 'opposition incumbency has no end date' do
      it 'returns formatted start date' do
        opposition_incumbency_node = @opposition_incumbency_nodes.first

        expect(opposition_incumbency_node).to respond_to(:date_range)
        expect(opposition_incumbency_node.date_range).to eq('13 Jul 2016 to present')
      end
    end
  end
end
