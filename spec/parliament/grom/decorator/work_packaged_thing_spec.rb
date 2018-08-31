require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::WorkPackagedThing, vcr: true do
  before(:each) do
    response = Parliament::Request::UrlRequest.new(
        base_url: 'http://localhost:3030/api/v1',
        builder: Parliament::Builder::NTripleResponseBuilder,
        decorators: Parliament::Grom::Decorator).statutory_instrument_by_id.get

    @work_packaged_thing = response.filter('https://id.parliament.uk/schema/WorkPackagedThing').first
  end

  describe '#web_link' do
    context 'Grom::Node has a web link' do
      it 'returns the web link of the Grom::Node object' do
        expect(@work_packaged_thing.web_link).to eq('http://www.legislation.gov.uk/uksi/2018/538/made')
      end
    end

    context 'Grom::Node does not have a web link' do
      it 'returns the an empty string' do
        expect(@work_packaged_thing.web_link).to eq('')
      end
    end
  end

  describe '#work_package' do
    context 'Grom::Node has a work package' do
      it 'returns a work package Grom::Node' do
        expect(@work_packaged_thing.work_package.type).to eq('https://id.parliament.uk/schema/WorkPackage')
      end
    end

    context 'Grom::Node does not have a work package' do
      it 'returns nil' do
        expect(@work_packaged_thing.work_package).to eq(nil)
      end
    end
  end
end
