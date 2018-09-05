require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::Gender, vcr: true do
  let(:response) { Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                       builder: Parliament::Builder::NTripleResponseBuilder,
                                                       decorators: Parliament::Grom::Decorator).person_by_id.get }
  let(:person_node) { response.filter('https://id.parliament.uk/schema/Person').first }

  describe '#name' do
    context 'Grom::Node has all the required objects' do
      it 'returns the gender name for a Grom::Node object of type Person' do
        expect(person_node.gender.name).to eq('Female')
      end
    end

    context 'Grom::Node has no gender name' do
      it 'returns an empty string' do
        expect(person_node.gender.name).to eq('')
      end
    end
  end
end
