require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::ConstituencyGroup, vcr: true do
  let(:id) { '1b316bf7-2064-4cf7-921a-865f13d082e1' }
  let(:response) { Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                                       builder: Parliament::Builder::NTripleResponseBuilder,
                                                       decorators: Parliament::Grom::Decorator).constituencies(id).get }
  describe '#name' do
    context 'constituency has a name' do
      it 'returns the name of the constituency' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]

        expect(constituency_node).to respond_to(:name)
        expect(constituency_node.name).to eq 'Walthamstow'
      end
    end

    context 'constituency has no name' do
      it 'returns an empty string' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]

        expect(constituency_node).to respond_to(:name)
        expect(constituency_node.name).to eq ''
      end
    end
  end

  describe '#start_date' do
    context 'constituency has a start date' do
      it 'returns the start date of the constituency' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]

        expect(constituency_node).to respond_to(:start_date)
        expect(constituency_node.start_date).to eq(DateTime.new(2010, 5, 6))
      end
    end

    context 'constituency has no start date' do
      it 'returns nil' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]

        expect(constituency_node).to respond_to(:start_date)
        expect(constituency_node.start_date).to be(nil)
      end
    end
  end

  describe '#end_date' do
    context 'constituency has an end date' do
      it 'returns the end date of the constituency' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]

        expect(constituency_node).to respond_to(:end_date)
        expect(constituency_node.end_date).to eq(DateTime.new(2015, 5, 6))
      end
    end

    context 'constituency has no end date' do
      it 'returns nil' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]

        expect(constituency_node).to respond_to(:end_date)
        expect(constituency_node.end_date).to be(nil)
      end
    end
  end

  describe '#seats' do
    context 'constituency has house seats' do
      it 'returns an array of house seats' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]

        expect(constituency_node).to respond_to(:seats)
        expect(constituency_node.seats.size).to eq 1
        expect(constituency_node.seats.first.type).to eq 'http://id.ukpds.org/schema/HouseSeat'
      end
    end

    context 'constituency has no house seats' do
      it 'returns an empty array' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]

        expect(constituency_node).to respond_to(:seats)
        expect(constituency_node.seats).to eq []
      end
    end
  end

  describe '#seat_incumbencies' do
    context 'constituency has seat incumbencies' do
      it 'returns an array of seat incumbencies' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]

        expect(constituency_node).to respond_to(:seat_incumbencies)
        expect(constituency_node.seat_incumbencies.size).to eq(2)
        expect(constituency_node.seat_incumbencies.first.type).to eq 'http://id.ukpds.org/schema/SeatIncumbency'
      end
    end

    context 'constituency has no seat incumbencies' do
      it 'returns an empty array' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]

        expect(constituency_node).to respond_to(:seat_incumbencies)
        expect(constituency_node.seat_incumbencies).to eq []
      end
    end
  end

  describe '#members' do
    context 'constituency has members' do
      it 'returns an array of members' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]

        expect(constituency_node).to respond_to(:members)
        expect(constituency_node.members.size).to eq(1)
        expect(constituency_node.members.first.type).to eq 'http://id.ukpds.org/schema/Person'
      end
    end

    context 'constituency has no seat incumbencies' do
      it 'returns an empty array' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]

        expect(constituency_node).to respond_to(:members)
        expect(constituency_node.members).to eq []
      end
    end
  end

  describe '#area' do
    context 'constituency has an area' do
      it 'returns the area' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]

        expect(constituency_node).to respond_to(:area)
        expect(constituency_node.area.type).to eq 'http://id.ukpds.org/schema/ConstituencyArea'
      end
    end

    context 'constituency has no constituency area' do
      it 'returns nil' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]

        expect(constituency_node).to respond_to(:area)
        expect(constituency_node.area).to be_nil
      end
    end
  end

  describe '#contact_points' do
    context 'constituency has contact points' do
      it 'returns an array of contact points' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]

        expect(constituency_node).to respond_to(:contact_points)
        expect(constituency_node.contact_points.size).to eq 1
        expect(constituency_node.contact_points.first.type).to eq 'http://id.ukpds.org/schema/ContactPoint'
      end
    end

    context 'constituency has no contact points' do
      it 'returns an empty array' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup').first

        expect(constituency_node).to respond_to(:contact_points)
        expect(constituency_node.contact_points).to eq []
      end
    end
  end

  describe '#current?' do
    it 'Grom::Node returns the correct value for a current or non current constituency' do
      id = '1921fc4a-6867-48fa-a4f4-6df05be005ce'
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).people(id).constituencies.get
      constituency_nodes = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')

      constituency_results = constituency_nodes.map(&:current?)

      expect(constituency_results).to eq([false, false, true])
    end
  end

  describe '#correct?' do
    it 'Grom::Node returns the value for a correct constituency' do
      id = '1921fc4a-6867-48fa-a4f4-6df05be005ce'
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).people(id).constituencies.get
      constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup').first
      constituency_node.correct = true

      expect(constituency_node.correct?).to eq(true)
    end
  end

  describe '#current_member_display_name' do
     let(:id) {'9d65a056-04c9-4aa5-999c-1a5905ce54fd'}
     let(:response) { Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                                           builder: Parliament::Builder::NTripleResponseBuilder,
                                                           decorators: Parliament::Grom::Decorator).constituencies(id).get}
    context 'constituency has seat incumbencies' do
      it 'and returns a single member' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]
        expect(constituency_node).to respond_to(:current_member_display_name)
        expect(constituency_node.members.size).to be(1)
        expect(constituency_node.current_member_display_name).to eq 'givename familyname - 1'
      end
    end

    context 'constituency without any seat incumbencies' do
      it 'returns an empty array' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]
        expect(constituency_node).to respond_to(:current_member_display_name)
        expect(constituency_node.current_member_display_name).to eq ''
      end
    end
  end

  describe '#current_member_party_name' do
    let(:id) {'9d65a056-04c9-4aa5-999c-1a5905ce54fd'}
    let(:response) { Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                                         builder: Parliament::Builder::NTripleResponseBuilder,
                                                         decorators: Parliament::Grom::Decorator).constituencies(id).get}

    context 'constituency member is a current seat incumbent' do
      it 'and returns a party name' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]
        expect(constituency_node.current_member_party_name).to eq('Conservative')
      end
    end

    context 'constituency member' do
      it 'does not return a party name' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]
        expect(constituency_node.current_member_party_name).to eq('')
      end
    end
  end

  describe '#region' do
    context 'constituency belongs to a region' do
      it 'returns the region the constituency sits within' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]

        expect(constituency_node).to respond_to(:region)
        expect(constituency_node.region.length).to eq 1
        expect(constituency_node.region.first.type).to eq 'http://data.ordnancesurvey.co.uk/ontology/admingeo/EuropeanRegion'
      end
    end

    context 'constituency does not belong to a region' do
      it 'returns an empty array' do
        constituency_node = response.filter('http://id.ukpds.org/schema/ConstituencyGroup')[0]

        expect(constituency_node).to respond_to(:region)
        expect(constituency_node.region).to eq([])
      end
    end
  end
end
