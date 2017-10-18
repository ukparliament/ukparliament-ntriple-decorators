require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::PostalAddress, vcr: true do
  let(:id) { '141869ad-3450-484b-add0-e3673e8c1e18' }
  let(:response) { Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                                       builder: Parliament::Builder::NTripleResponseBuilder,
                                                       decorators: Parliament::Grom::Decorator).constituencies(id).contact_point.get }

  before(:each) do
    @postal_address_nodes = response.filter('https://id.parliament.uk/schema/PostalAddress')
  end

  describe '#full_address' do
    context 'Grom::Node has all the required objects' do
      it 'returns the full address for a Grom::Node object of type PostalAddress' do
        postal_address_node = @postal_address_nodes.first

        expect(postal_address_node).to respond_to(:full_address)
        expected_full_address = 'House of Commons, London, SW1A 0AA'
        expect(postal_address_node.full_address).to eq(expected_full_address)
      end
    end

    context 'Grom::Node has no postal addresses' do
      it 'returns an empty array' do
        postal_address_node = @postal_address_nodes.first

        expect(postal_address_node.full_address).to eq('')
      end
    end
  end
end
