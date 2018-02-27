require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::GovRegisterGovernmentOrganisation, vcr: true do
  before(:each) do
    response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                   builder: Parliament::Builder::NTripleResponseBuilder,
                                                   decorators: Parliament::Grom::Decorator).group_government_organisation_index.get
    @gov_register_government_organisation_nodes = response.filter('https://id.parliament.uk/schema/GovRegisterGovernmentOrganisation')
  end

  describe '#name' do
    context 'Grom::Node has all the required objects' do
      it 'confirms that the type for this Grom::Node object is Group' do
        group = @gov_register_government_organisation_nodes.first

        expect(group.type).to eq('https://id.parliament.uk/schema/GovRegisterGovernmentOrganisation')
      end

      it 'returns the name of the Grom::Node object' do
        group = @gov_register_government_organisation_nodes.first

        expect(group.name).to eq('Department of Energy and Climate Change')
      end
    end

    context 'Grom::Node does not have a name' do
      it 'confirms that name for this Grom::Node node do not exist' do
        group = @gov_register_government_organisation_nodes[0]

        expect(group.name).to eq('')
      end
    end
  end

  describe '#start_date' do
    context 'Grom::Node has all the required objects' do
      it 'returns the start_date of the Grom::Node object' do
        group = @gov_register_government_organisation_nodes.first

        expect(group.start_date).to eq(DateTime.parse('2008-10-03T00:00:00+00:00'))
      end
    end

    context 'Grom::Node does not have a start_date' do
      it 'confirms that start_date for this Grom::Node node does not exist' do
        group = @gov_register_government_organisation_nodes[0]

        expect(group.start_date).to eq(nil)
      end
    end
  end

  describe '#end_date' do
    context 'Grom::Node has all the required objects' do
      it 'returns the end_date of the Grom::Node object' do
        group = @gov_register_government_organisation_nodes.first

        expect(group.end_date).to eq(DateTime.parse('2016-07-14T00:00:00+00:00'))
      end
    end

    context 'Grom::Node does not have a end_date' do
      it 'confirms that end_date for this Grom::Node node does not exist' do
        group = @gov_register_government_organisation_nodes[0]

        expect(group.end_date).to eq(nil)
      end
    end
  end
end
