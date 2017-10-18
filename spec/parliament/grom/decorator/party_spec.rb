require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::Party, vcr: true do
  describe '#name' do
    before(:each) do
      id = '1921fc4a-6867-48fa-a4f4-6df05be005ce'
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).people(id).parties.get
      @party_nodes = response.filter('https://id.parliament.uk/schema/Party')
    end

    context 'Grom::Node has all the required objects' do
      it 'confirms that the type for this Grom::Node object is Party' do
        party_node = @party_nodes.first

        expect(party_node.type).to eq('https://id.parliament.uk/schema/Party')
      end

      it 'returns the name of the party for the Grom::Node object' do
        party_node = @party_nodes.first

        expect(party_node.name).to eq('Labour')
      end
    end

    context 'Grom::Node does not have have a name' do
      it 'confirms that the name for this Grom::Node node does not exist' do
        objects_without_name_node = @party_nodes[0]

        expect(objects_without_name_node.name).to eq('')
      end
    end
  end

  describe '#party_memberships' do
    before(:each) do
      id = '1921fc4a-6867-48fa-a4f4-6df05be005ce'
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).people(id).parties.get
      @party_nodes = response.filter('https://id.parliament.uk/schema/Party')
    end

    context 'Grom::Node has all the required objects' do
      it 'returns the party memberships for a Grom::Node object of type Party' do
        party_node = @party_nodes.first

        expect(party_node.party_memberships.size).to eq(2)
        expect(party_node.party_memberships.first.type).to eq('https://id.parliament.uk/schema/PartyMembership')
      end
    end

    context 'Grom::Node has no party memberships' do
      it 'returns an empty array' do
        party_node = @party_nodes[0]

        expect(party_node.party_memberships).to eq([])
      end
    end
  end

  describe '#member_count' do
    before(:each) do
      id = '4b77dd58-f6ba-4121-b521-c8ad70465f52'
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).houses(id).parties.current.get
      @party_nodes = response.filter('https://id.parliament.uk/schema/Party')
    end

    context 'Grom::Node has a member count' do
      it 'returns the member count for a Grom::Node object of type Party' do
        party_node = @party_nodes.first

        expect(party_node.member_count).to eq(2)
      end
    end

    context 'Grom::Node has no count' do
      it 'returns nil' do
        party_node = @party_nodes[1]

        expect(party_node.member_count).to be(nil)
      end
    end
  end

  describe '#commons_count' do
    before(:each) do
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).parties.get
      @party_node = response.filter('https://id.parliament.uk/schema/Party').first
    end

    context 'Grom::Node has a Commons count' do
      it 'returns the Commons count for a Grom::Node object of type Party' do
        expect(@party_node.commons_count).to eq(0)
      end
    end

    context 'Grom::Node has no Commons count' do
      it 'returns nil' do
        expect(@party_node.commons_count).to be(nil)
      end
    end
  end

  describe '#lords_count' do
    before(:each) do
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).parties.get
      @party_node = response.filter('https://id.parliament.uk/schema/Party').first
    end

    context 'Grom::Node has a Lords count' do
      it 'returns the Lords count for a Grom::Node object of type Party' do
        expect(@party_node.lords_count).to eq(211)
      end
    end

    context 'Grom::Node has no Lords count' do
      it 'returns nil' do
        expect(@party_node.lords_count).to be(nil)
      end
    end
  end

  describe '#current?' do
    it 'Grom::Node returns the correct value for a current or non current party' do
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).parties.get
      @party_nodes = response.filter('https://id.parliament.uk/schema/Party')

      party_results = @party_nodes.map(&:current?)

      expect(party_results).to eq([true, true, true, false, false, false, false, false])
    end
  end
end
