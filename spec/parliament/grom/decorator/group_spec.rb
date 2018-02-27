require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::Group, vcr: true do
  describe '#name' do
    before(:each) do
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).group_index.get
      @group_nodes = response.filter('https://id.parliament.uk/schema/Group')
    end

    context 'Grom::Node has all the required objects' do
      it 'confirms that the type for this Grom::Node object is Group' do
        group = @group_nodes.first

        expect(group.type).to eq('https://id.parliament.uk/schema/Group')
      end

      it 'returns the name of the Grom::Node object' do
        group = @group_nodes.first

        expect(group.name).to eq('Culture, Media and Sport Committee')
      end
    end

    context 'Grom::Node does not have a name' do
      it 'confirms that name for this Grom::Node node do not exist' do
        group = @group_nodes[0]

        expect(group.name).to eq('')
      end
    end
  end

  describe '#start_date' do
    before(:each) do
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).group_index.get
      @group_nodes = response.filter('https://id.parliament.uk/schema/Group')
    end

    context 'Grom::Node has all the required objects' do
      it 'returns the start_date of the Grom::Node object' do
        group = @group_nodes.first

        expect(group.start_date).to eq(DateTime.parse('Mon, 28 Jul 1997 00:00:00.000000000 +0000'))
      end
    end

    context 'Grom::Node does not have a start_date' do
      it 'confirms that start_date for this Grom::Node node does not exist' do
        group = @group_nodes[0]

        expect(group.start_date).to eq(nil)
      end
    end
  end

  describe '#end_date' do
    before(:each) do
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).group_index.get
      @group_nodes = response.filter('https://id.parliament.uk/schema/Group')
    end

    context 'Grom::Node has all the required objects' do
      it 'returns the end_date of the Grom::Node object' do
        group = @group_nodes.first

        expect(group.end_date).to eq(DateTime.parse('DateTime: 2017-09-12T00:00:00+00:00 ((2458009j,0s,0n),+0s,2299161j'))
      end
    end

    context 'Grom::Node does not have a end_date' do
      it 'confirms that end_date for this Grom::Node node does not exist' do
        group = @group_nodes[0]

        expect(group.end_date).to eq(nil)
      end
    end
  end
end
