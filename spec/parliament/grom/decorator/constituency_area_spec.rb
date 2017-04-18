require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::ConstituencyArea, vcr: true do
  let(:id) { '1b316bf7-2064-4cf7-921a-865f13d082e1' }
  let(:response) { Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                                       builder: Parliament::Builder::NTripleResponseBuilder).constituencies(id).get }

  describe '#latitude' do
    context 'constituency has a latitude' do
      it 'returns the latitude of the constituency area' do
        constituency_area_node = response.filter('http://id.ukpds.org/schema/ConstituencyArea')[0]

        expect(constituency_area_node).to respond_to(:latitude)
        expect(constituency_area_node.latitude).to eq '51.5850956402'
      end
    end

    context 'constituency has no latitude' do
      it 'returns an empty string' do
        constituency_area_node = response.filter('http://id.ukpds.org/schema/ConstituencyArea')[0]

        expect(constituency_area_node).to respond_to(:latitude)
        expect(constituency_area_node.latitude).to eq ''
      end
    end
  end

  describe '#longitude' do
    context 'constituency has a longitude' do
      it 'returns the longitude of the constituency area' do
        constituency_area_node = response.filter('http://id.ukpds.org/schema/ConstituencyArea')[0]

        expect(constituency_area_node).to respond_to(:longitude)
        expect(constituency_area_node.longitude).to eq '-0.0277980827695'
      end
    end

    context 'constituency has no longitude' do
      it 'returns an empty string' do
        constituency_area_node = response.filter('http://id.ukpds.org/schema/ConstituencyArea')[0]

        expect(constituency_area_node).to respond_to(:longitude)
        expect(constituency_area_node.longitude).to eq ''
      end
    end
  end

  describe '#polygon' do
    context 'constituency has a polygon' do
      it 'returns the polygon of the constituency area' do
        constituency_area_node = response.filter('http://id.ukpds.org/schema/ConstituencyArea')[0]

        expect(constituency_area_node).to respond_to(:polygon)
        expected_polygon = 'Polygon((-0.03982748537 51.60513413577,-0.03979437830 51.60516506019))'
        expect(constituency_area_node.polygon).to eq expected_polygon
      end
    end

    context 'constituency has no polygon' do
      it 'returns an empty string' do
        constituency_area_node = response.filter('http://id.ukpds.org/schema/ConstituencyArea')[0]

        expect(constituency_area_node).to respond_to(:polygon)
        expect(constituency_area_node.polygon).to eq ''
      end
    end
  end
end
