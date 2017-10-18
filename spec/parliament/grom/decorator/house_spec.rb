require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::House, vcr: true do
  describe '#name' do
    before(:each) do
      id = '80c2b596-494f-4dab-97ed-867729a40451'
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                          builder: Parliament::Builder::NTripleResponseBuilder,
                                          decorators: Parliament::Grom::Decorator).people(id).houses.get
      @house_nodes = response.filter('https://id.parliament.uk/schema/House')
    end

    context 'Grom::Node has all the required objects' do
      it 'returns the name for a Grom::Node object of type House' do
        house_node = @house_nodes.first

        expect(house_node.name).to eq('House of Commons')
      end
    end

    context 'Grom::Node has no name' do
      it 'returns an empty string' do
        house_node = @house_nodes.first

        expect(house_node.name).to eq('')
      end
    end
  end

  describe '#seats' do
    before(:each) do
      id = '80c2b596-494f-4dab-97ed-867729a40451'
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).people(id).houses.get
      @house_nodes = response.filter('https://id.parliament.uk/schema/House')
    end

    context 'Grom::Node has all the required objects' do
      it 'returns the seats for a Grom::Node object of type House' do
        house_node = @house_nodes.first

        expect(house_node.seats.size).to eq(1)
        expect(house_node.seats.first.type).to eq('https://id.parliament.uk/schema/HouseSeat')
      end
    end

    context 'Grom::Node has no seats' do
      it 'returns an empty string' do
        house_node = @house_nodes.first

        expect(house_node.seats).to eq([])
      end
    end
  end

  describe '#seat_incumbencies' do
    before(:each) do
      id = '80c2b596-494f-4dab-97ed-867729a40451'
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).people(id).houses.get
      @house_nodes = response.filter('https://id.parliament.uk/schema/House')
    end

    context 'Grom::Node has all the required objects' do
      it 'returns the seat_incumbencies for a Grom::Node object of type House' do
        house_node = @house_nodes.first

        expect(house_node.seat_incumbencies.size).to eq(6)
        expect(house_node.seat_incumbencies.first.type).to eq('https://id.parliament.uk/schema/SeatIncumbency')
      end
    end

    context 'Grom::Node has no seat incumbencies' do
      it 'returns an empty string' do
        house_node = @house_nodes.first

        expect(house_node.seat_incumbencies).to eq([])
      end
    end
  end

  describe '#house_incumbencies' do
    before(:each) do
      id = '511a622a-22c2-4e3f-9a17-e5a024380138'
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).people(id).houses.get
      @house_nodes = response.filter('https://id.parliament.uk/schema/House')
    end

    context 'Grom::Node has all the required objects' do
      it 'returns the house_incumbencies for a Grom::Node object of type House' do
        house_node = @house_nodes.first

        expect(house_node.house_incumbencies.size).to eq(1)
        expect(house_node.house_incumbencies.first.type).to eq('https://id.parliament.uk/schema/HouseIncumbency')
      end
    end

    context 'Grom::Node has no house incumbencies' do
      it 'returns an empty string' do
        house_node = @house_nodes.first

        expect(house_node.house_incumbencies).to eq([])
      end
    end
  end
end
