require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::Group, vcr: true do
  describe '#name' do
    before(:each) do
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).group_by_id.get
      @group_nodes = response.filter('https://id.parliament.uk/schema/Group')
    end

    context 'Grom::Node has all the required objects' do
      it 'confirms that the type for this Grom::Node object is Group' do
        group = @group_nodes.first

        expect(group.type).to eq('https://id.parliament.uk/schema/Group')
      end

      it 'returns the name of the Grom::Node object' do
        group = @group_nodes.first

        expect(group.name).to eq('Human Rights (Joint Committee)')
      end

      it 'does not return the name for the this Grom::Node object' do
        group = @group_nodes.first

        expect(group.name).to eq('')
      end
    end
  end

  describe '#formal_body_name' do
    before(:each) do
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).group_by_id.get
      @group_nodes = response.filter('https://id.parliament.uk/schema/Group')
    end

    context 'Grom::Node has all the required objects' do
      it 'returns the formal body name of the Grom::Node object' do
        group = @group_nodes.first

        expect(group.formal_body_name).to eq('Human Rights (Joint Committee)')
      end
    end

    context 'Grom::Node does not have all the required objects' do
      it 'does not return the formal body name for this Grom::Node object' do
        group = @group_nodes.first

        expect(group.formal_body_name).to eq('')
      end
    end
  end


  describe '#formal_body_remit' do
    before(:each) do
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).group_by_id.get
      @group_nodes = response.filter('https://id.parliament.uk/schema/Group')
    end

   context '#is_chair?' do
    context 'is a committee chair' do
      it 'will return true' do
        expect(@group_nodes[0].is_chair?).to eq(true)
      end
    end

    context 'is not a committee chair' do
      it 'will return false' do
        expect(@group_nodes[0].is_chair?).to eq(false)
      end
    end
   end
  end 

  describe '#formal_body_remit' do
    before(:each) do
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).group_by_id.get
      @group_nodes = response.filter('https://id.parliament.uk/schema/Group')
    end

    context 'Grom::Node has all the required objects' do
      it 'returns the formal body description of the Grom::Node object' do
        group = @group_nodes.first

        expect(group.formal_body_remit).to eq('We examine human rights issues in the UK and check government bills are compatible with human rights.')
      end
    end

    context 'Grom::Node does not have all the required objects' do
      it 'does not return the formal body name for this Grom::Node object' do
        group = @group_nodes.first

        expect(group.formal_body_remit).to eq('')
      end
    end
  end

  describe '#start_date' do
    before(:each) do
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).group_by_id.get
      @group_nodes = response.filter('https://id.parliament.uk/schema/Group')
    end

    context 'Grom::Node has all the required objects' do
      it 'returns the start_date of the Grom::Node object' do
        group = @group_nodes.first

        expect(group.start_date).to eq(DateTime.parse('Wed, 17 Jan 2001 00:00:00.000000000 +0000'))
      end
    end

    context 'Grom::Node does not have a start_date' do
      it 'confirms that start_date for this Grom::Node node does not exist' do
        group = @group_nodes[0]

        expect(group.start_date).to eq(nil)
      end
    end
  end

  describe '#is_joint?' do
    before(:each) do
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).group_by_id.get
      @group_nodes = response.filter('https://id.parliament.uk/schema/Group')
    end

    context '#is_joint?' do
      context 'is a joint committee' do
        it 'will return true' do
          expect(@group_nodes[0].is_joint?).to eq(true)
        end
      end

      context 'is not a joint committee' do
        it 'will return false' do
          expect(@group_nodes[0].is_joint?).to eq(false)
        end
      end
    end

  end
  
  describe '#end_date' do
    before(:each) do
      response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                     builder: Parliament::Builder::NTripleResponseBuilder,
                                                     decorators: Parliament::Grom::Decorator).group_by_id.get
      @group_nodes = response.filter('https://id.parliament.uk/schema/Group')
    end

    context 'Grom::Node has all the required objects' do
      it 'returns the end_date of the Grom::Node object' do
        group = @group_nodes.first

        expect(group.end_date).to eq(DateTime.parse('Tue, 06 Mar 2018 00:00:00.000000000 +0000'))
      end
    end

    context 'Grom::Node does not have a end_date' do
      it 'confirms that end_date for this Grom::Node node does not exist' do
        group = @group_nodes[0]

        expect(group.end_date).to eq(nil)
      end
    end
  end

 
  describe '#member_count' do
    before(:each) do
        response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                       builder: Parliament::Builder::NTripleResponseBuilder,
                                                       decorators: Parliament::Grom::Decorator).group_by_id.get
        @group_nodes = response.filter('https://id.parliament.uk/schema/Group')
    end

    context 'Grom::Node has a members count' do
        it 'returns the members count for a Grom::Node object of type Group' do
          group = @group_nodes.first
          expect(group.count.to_i).to eq(12)
        end
    end
  end
end


