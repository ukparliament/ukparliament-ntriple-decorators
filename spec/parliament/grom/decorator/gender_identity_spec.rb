require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::GenderIdentity, vcr: true do
  let(:response) do
    Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                        builder: Parliament::Builder::NTripleResponseBuilder,
                                        decorators: Parliament::Grom::Decorator).people('626b57f9-6ef0-475a-ae12-40a44aca7eff').get
  end

  before(:each) do
    @gender_identity_nodes = response.filter('https://id.parliament.uk/schema/GenderIdentity')
  end

  describe '#gender' do
    context 'Grom::Node has all the required objects' do
      it 'returns the gender for a Grom::Node object of type GenderIdentity' do
        gender_identity_node = @gender_identity_nodes.first

        expect(gender_identity_node.gender.genderName).to eq('F')
        expect(gender_identity_node.gender.type).to eq('https://id.parliament.uk/schema/Gender')
      end
    end

    context 'Grom::Node has no gender' do
      it 'returns nil' do
        gender_identity_node = @gender_identity_nodes[1]

        expect(gender_identity_node.gender).to be(nil)
      end
    end
  end
end
