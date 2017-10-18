require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::MemberImage, vcr: true do
  let(:response) do
    Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                        builder: Parliament::Builder::NTripleResponseBuilder,
                                        decorators: Parliament::Grom::Decorator).media('12345678').get
  end

  before(:each) do
    @image_nodes = response.filter('https://id.parliament.uk/schema/MemberImage')
  end

  describe '#person' do
    context 'Grom::Node has all the required objects' do
      it 'returns the person for a Grom::Node object of type MemberImage' do
        image_node = @image_nodes.first

        expect(image_node.person.type).to eq('https://id.parliament.uk/schema/Person')
      end
    end

    context 'Grom::Node has no person' do
      it 'returns nil' do
        image_node = @image_nodes.first

        expect(image_node.person).to be(nil)
      end
    end
  end
end