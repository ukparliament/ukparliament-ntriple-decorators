require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::Person, vcr: true do
  let(:response) { Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                       builder: Parliament::Builder::NTripleResponseBuilder,
                                                       decorators: Parliament::Grom::Decorator).person_by_id.get }
  let(:person_node) { response.filter('https://id.parliament.uk/schema/Person').first }

  describe '#full_name' do
    context 'Grom::Node has all the required objects' do
      it 'returns the full name for a Grom::Node objects of type Person' do
        expect(person_node.full_name).to eq('Diane Abbott')
      end
    end

    context 'Grom::Node has no personGivenName' do
      it 'returns a full name with just personFamilyName' do
        expect(person_node.full_name).to eq('Abbott')
      end
    end

    context 'Grom::Node has no personFamilyName' do
      it 'returns a full name with just personGivenName' do
        expect(person_node.full_name).to eq('Diane')
      end
    end

    context 'Grom::Node has no personGivenName or personFamilyName' do
      it 'returns an empty string' do
        expect(person_node.full_name).to eq('')
      end
    end
  end

  describe '#display_name' do
    context 'Grom::Node has all the required objects' do
      it 'returns the given display_name for a Grom::Node objects of type Person' do
        expect(person_node.display_name).to eq('Ms Diane Abbott')
      end
    end

    context 'Grom::Node has no displayAs' do
      it 'returns the full_name' do
        expect(person_node.display_name).to eq('Diane Abbott')
      end
    end
  end
end
