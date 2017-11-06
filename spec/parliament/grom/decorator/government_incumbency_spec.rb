require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::GovernmentIncumbency, vcr: true do
  before(:each) do
    id = 'soTeywda'
    response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3000/api/v1',
    builder: Parliament::Builder::NTripleResponseBuilder,
    decorators: Parliament::Grom::Decorator).person_by_id.get
    @government_incumbency_nodes = response.filter('https://id.parliament.uk/schema/GovernmentIncumbency')
  end

  context '#start_date' do
    context 'Grom::Node has a start date' do
      it 'will return correct start date' do
        expect(@government_incumbency_nodes[0].start_date).to eq(DateTime.parse('2015-05-07T00:00:00+00:00'))
        expect(@government_incumbency_nodes[0].start_date.class).to eq(DateTime)
      end
    end

    context 'Grom::Node has no start date' do
      it 'will return nil' do
        expect(@government_incumbency_nodes[0].start_date).to eq(nil)
      end
    end
  end

  context '#end_date' do
    context 'Grom::Node has an end date' do
      it 'will return correct end date' do
        expect(@government_incumbency_nodes[0].end_date).to eq(DateTime.parse('2017-06-07T00:00:00+00:00'))
        expect(@government_incumbency_nodes[0].end_date.class).to eq(DateTime)
      end
    end

    context 'Grom::Node has no end date' do
      it 'will return nil' do
        expect(@government_incumbency_nodes[0].end_date).to eq(nil)
      end
    end
  end

  context '#current?' do
    context 'is current' do
      it 'will return true' do
        expect(@government_incumbency_nodes[0].current?).to eq(true)
      end
    end

    context 'is not current' do
      it 'will return false' do
        expect(@government_incumbency_nodes[0].current?).to eq(false)
      end
    end
  end

  describe '#date_range' do
    include_examples 'date range has no start date' do
      let(:node) { @government_incumbency_nodes.first }
    end

    include_examples 'date range has no end date' do
      let(:node) { @government_incumbency_nodes.first }
    end

    include_examples 'date range has start and end dates' do
      let(:node) { @government_incumbency_nodes.first }
    end
  end
end
