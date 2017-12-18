require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::Audience, vcr: true do
  before(:each) do
    id = 'asdf1234'
    response = Parliament::Request::UrlRequest.new(
      base_url: 'http://localhost:3030/api/v1',
      builder: Parliament::Builder::NTripleResponseBuilder,
      decorators: Parliament::Grom::Decorator).audience_by_id.get
    @audience = (response.filter('http://example.com/content/Audience')).first
  end

  describe '#audience_name' do
    context 'Grom::Node has all the required objects' do
      it 'confirms that the type for this Grom::Node object is Article' do
        expect(@audience.type).to eq('http://example.com/content/Audience')
      end

      it 'returns the title of the article the Grom::Node object' do
        expect(@audience.audience_name).to eq('audience 1')
      end
    end

    context 'Grom::Node does not have a title' do
      it 'returns an empty string' do
        expect(@audience.audience_name).to eq('')
      end
    end
  end
end
