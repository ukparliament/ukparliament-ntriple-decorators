require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::Group, vcr: true do
  let(:response) { Parliament::Request::UrlRequest.new(
      base_url: 'http://localhost:3030/api/v1',
      builder: Parliament::Builder::NTripleResponseBuilder,
      decorators: Parliament::Grom::Decorator).group_by_id.get }
  let(:group_node) { response.filter('https://id.parliament.uk/schema/Group').first }

  describe '#start_date' do
    context 'Grom::Node has all the required objects' do
      it 'returns the start_date of the Grom::Node object' do
        expect(group_node.start_date).to eq(DateTime.parse('Wed, 01 Oct 1969 00:00:00.000000000 +0000'))
      end
    end

    context 'Grom::Node does not have a start_date' do
      it 'confirms that start_date for this Grom::Node node does not exist' do
        expect(group_node.start_date).to eq(nil)
      end
    end
  end

  describe '#end_date' do
    context 'Grom::Node has all the required objects' do
      it 'returns the end_date of the Grom::Node object' do
        expect(group_node.end_date).to eq(DateTime.parse('Fri, 10 May 1974 00:00:00.000000000 +0000'))
      end
    end

    context 'Grom::Node does not have a end_date' do
      it 'confirms that end_date for this Grom::Node node does not exist' do
        expect(group_node.end_date).to eq(nil)
      end
    end
  end
end
