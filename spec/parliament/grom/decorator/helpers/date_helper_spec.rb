require_relative '../../../../spec_helper'

describe Parliament::Grom::Decorator::Helpers::DateHelper, vcr: true do
  let(:id) { '4b77dd58-f6ba-4121-b521-c8ad70465f52' }
  let(:response) do
    Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                        builder: Parliament::Builder::NTripleResponseBuilder,
                                        decorators: Parliament::Grom::Decorator).houses(id).members.current.get
  end

  before(:each) do
    @incumbency_nodes = response.filter('https://id.parliament.uk/schema/ParliamentaryIncumbency')
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
        expect(incumbency_node.date_range).to eq('7 May 2015 to 7 May 2016')
      end
    end

    context 'incumbency has no end date' do
      it 'returns formatted start date' do
        incumbency_node = @incumbency_nodes.first

        expect(incumbency_node).to respond_to(:date_range)
        expect(incumbency_node.date_range).to eq('7 May 2015 to present')
      end
    end
  end
end