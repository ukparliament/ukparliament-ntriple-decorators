require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::ContactPoint, vcr: true do
  before(:each) do
    response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
      builder: Parliament::Builder::NTripleResponseBuilder,
      decorators: Parliament::Grom::Decorator).person_by_id.get
      @contact_point_nodes = response.filter('https://id.parliament.uk/schema/ContactPoint')
    end

  describe '#postal_addresses' do
    context 'Grom::Node has all the required objects' do
      it 'returns the postal addresses for a Grom::Node object of type ContactPoint' do
        contact_point_node = @contact_point_nodes.first
        expect(contact_point_node.postal_addresses.size).to eq(1)
        expect(contact_point_node.postal_addresses.first.type).to eq('https://id.parliament.uk/schema/PostalAddress')
      end

      it 'returns an empty array for postal addresses with a full address of less than 3 characters' do
        contact_point_node = @contact_point_nodes[0]
        expect(contact_point_node.postal_addresses).to eq([])
      end
    end

    context 'Grom::Node has no postal addresses' do
      it 'returns an empty array' do
        contact_point_node = @contact_point_nodes[0]
        expect(contact_point_node.postal_addresses).to eq([])
      end
    end
  end

  describe '#email' do
    context 'Grom::Node has all the required objects' do
      it 'returns the email for a Grom::Node object of type ContactPoint' do
        contact_point_node = @contact_point_nodes.first
        expect(contact_point_node).to respond_to(:email)
        expect(contact_point_node.email).to eq('emailaddress@parliament.uk')
      end

      it 'returns the email stripped of whitespace for a Grom::Node object of type ContactPoint' do
        contact_point_node = @contact_point_nodes.first
        expect(contact_point_node).to respond_to(:email)
        expect(contact_point_node.email).to eq('emailaddress@parliament.uk')
      end

      it 'returns an empty string for email addresses with less than 3 characters' do
        contact_point_node = @contact_point_nodes[0]
        expect(contact_point_node).to respond_to(:email)
        expect(contact_point_node.email).to eq('')
      end
    end

    context 'Grom::Node has no email' do
      it 'returns an empty string' do
        contact_point_node = @contact_point_nodes[0]
          expect(contact_point_node.email).to eq('')
      end
    end
  end

  describe '#phone_number' do
    context 'Grom::Node has all the required objects' do
      it 'returns the phone number for a Grom::Node object of type ContactPoint' do
        contact_point_node = @contact_point_nodes.first
        expect(contact_point_node).to respond_to(:phone_number)
        expect(contact_point_node.phone_number).to eq('1234 567 8910')
      end

      it 'returns an empty string for phone numbers with less than 3 characters' do
        contact_point_node = @contact_point_nodes[0]
        expect(contact_point_node).to respond_to(:phone_number)
        expect(contact_point_node.phone_number).to eq('')
      end
    end

    context 'Grom::Node has no phone number' do
      it 'returns an empty string' do
        contact_point_node = @contact_point_nodes[0]
        expect(contact_point_node).to respond_to(:phone_number)
        expect(contact_point_node.phone_number).to eq('')
      end
    end
  end

  describe '#fax_number' do
    context 'Grom::Node has all the required objects' do
      it 'returns the fax number for a Grom::Node object of type ContactPoint' do
        contact_point_node = @contact_point_nodes.first
        expect(contact_point_node).to respond_to(:fax_number)
        expect(contact_point_node.fax_number).to eq('1234 567 8910')
      end

      it 'returns an empty string for fax numbers with less than 3 characters' do
        contact_point_node = @contact_point_nodes[0]
        expect(contact_point_node).to respond_to(:fax_number)
        expect(contact_point_node.fax_number).to eq('')
      end
    end

    context 'Grom::Node has no fax number' do
      it 'returns an empty string' do
        contact_point_node = @contact_point_nodes[0]
        expect(contact_point_node).to respond_to(:fax_number)
        expect(contact_point_node.fax_number).to eq('')
      end
    end
  end

  describe '#person' do
    context 'Grom::Node has all the required objects' do
      it 'returns the object of type Person for a Grom::Node object of type ContactPoint' do
        contact_point_node = @contact_point_nodes.first
        expect(contact_point_node).to respond_to(:person)
        expect(contact_point_node.person.first.type).to eq('https://id.parliament.uk/schema/Person')
        expect(contact_point_node.person.first.given_name).to eq('FirstName')
        expect(contact_point_node.person.first.family_name).to eq('LastName')
      end
    end

    context 'Grom::Node has no person associated with it' do
      it 'returns an empty string' do
        contact_point_node = @contact_point_nodes[0]
        expect(contact_point_node).to respond_to(:person)
        expect(contact_point_node.person.size).to eq(0)
      end
    end
  end

  describe '#parliamentary_incumbency' do
    context 'Grom::Node has all the required objects' do
      it 'returns the object of type ParliamentaryIncumbency for a Grom::Node object of type ContactPoint' do
        contact_point_node = @contact_point_nodes.first
        expect(contact_point_node).to respond_to(:parliamentary_incumbency)
        expect(contact_point_node.parliamentary_incumbency.type).to eq('https://id.parliament.uk/schema/ParliamentaryIncumbency')
      end
    end

    context 'Grom::Node has no parliamentary incumbency associated with it' do
      it 'returns nil' do
        contact_point_node = @contact_point_nodes.first
        expect(contact_point_node).to respond_to(:parliamentary_incumbency)
        expect(contact_point_node.parliamentary_incumbency).to be(nil)
      end
    end
  end
end
