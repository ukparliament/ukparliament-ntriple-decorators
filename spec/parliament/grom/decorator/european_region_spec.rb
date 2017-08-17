require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::EuropeanRegion, vcr: true do
  before(:each) do
    response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
    builder: Parliament::Builder::NTripleResponseBuilder,
    decorators: Parliament::Grom::Decorator).region_index.get
    @region_nodes = response.filter('http://data.ordnancesurvey.co.uk/ontology/admingeo/EuropeanRegion')
  end

  describe '#name' do
    context 'Grom::Node has all the required objects' do
      it 'confirms that the type for this Grom::Node object is EuropeanRegion' do
        region_node = @region_nodes.first

        expect(region_node.type).to eq('http://data.ordnancesurvey.co.uk/ontology/admingeo/EuropeanRegion')
      end

      it 'returns the name of the party for the Grom::Node object' do
        region_node = @region_nodes.first

        expect(region_node.name).to eq('Yorkshire and the Humber ')
      end
    end

    context 'Grom::Node does not have have a name' do
      it 'confirms that the name for this Grom::Node node does not exist' do
        objects_without_name_node = @region_nodes[0]

        expect(objects_without_name_node.name).to eq('')
      end
    end
  end

  describe '#gss_code' do
    context 'Grom::Node has all the required objects' do
      it 'returns the gssCode for a Grom::Node object of type EuropeanRegion' do
        region_node = @region_nodes.first

        expect(region_node.gss_code).to eq('E15000003')
      end
    end

    context 'Grom::Node has no gssCode' do
      it 'returns nil' do
        region_node = @region_nodes[0]

        expect(region_node.gss_code).to eq(nil)
      end
    end
  end

  describe '#constituency_count' do
    context 'Grom::Node has all the required objects' do
      it 'returns the gssCode for a Grom::Node object of type EuropeanRegion' do
        region_node = @region_nodes.first

        expect(region_node.constituency_count).to eq('54')
      end
    end

    context 'Grom::Node has no count' do
      it 'returns nil' do
        region_node = @region_nodes[0]

        expect(region_node.constituency_count).to eq(nil)
      end
    end
  end
end
