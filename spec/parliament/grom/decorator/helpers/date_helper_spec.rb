require_relative '../../../../spec_helper'

describe Parliament::Grom::Decorator::Helpers::DateHelper, vcr: true do
  let(:response) do
    Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                        builder: Parliament::Builder::NTripleResponseBuilder,
                                        decorators: Parliament::Grom::Decorator).group_by_id.get
  end

  subject(:group_node) { response.filter('https://id.parliament.uk/schema/Group').first }

  describe '#date_range' do
    context 'group has no start_date' do
      it 'returns no date' do
        expect(group_node.date_range).to eq('[Date unavailable]')
      end
    end

    context 'group has an end date' do
      it 'returns full formatted start and end date' do
        expect(group_node.date_range).to eq('1 October 1969 to 10 May 1974')
      end
    end

    context 'group has no end date' do
      it 'returns formatted start date' do
        expect(group_node.date_range).to eq('1 October 1969 to present')
      end
    end
  end
end