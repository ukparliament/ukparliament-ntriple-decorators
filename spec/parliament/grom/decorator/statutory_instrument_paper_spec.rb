require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::StatutoryInstrumentPaper, vcr: true do
  before(:each) do
    response = Parliament::Request::UrlRequest.new(
        base_url: 'http://localhost:3030/api/v1',
        builder: Parliament::Builder::NTripleResponseBuilder,
        decorators: Parliament::Grom::Decorator).statutory_instrument_by_id.get

    @statutory_instrument_paper = response.filter('https://id.parliament.uk/schema/StatutoryInstrumentPaper').first
  end

  describe '#name' do
    context 'Grom::Node has a name' do
      it 'returns the name of the Grom::Node object' do
        expect(@statutory_instrument_paper.name).to eq('Insurance Companies (Taxation of Re-insurance Business) Regulations 2018')
      end
    end

    context 'Grom::Node does not have a name' do
      it 'returns an empty string' do
        expect(@statutory_instrument_paper.name).to eq('')
      end
    end
  end

  describe '#prefix' do
    context 'Grom::Node has a prefix' do
      it 'returns the prefix of the Grom::Node object' do
        expect(@statutory_instrument_paper.prefix).to eq('SI')
      end
    end

    context 'Grom::Node does not have a prefix' do
      it 'returns an empty string' do
        expect(@statutory_instrument_paper.prefix).to eq('')
      end
    end
  end

  describe '#year' do
    context 'Grom::Node has a year' do
      it 'returns the year of the Grom::Node object' do
        expect(@statutory_instrument_paper.year).to eq('2018')
      end
    end

    context 'Grom::Node does not have a year' do
      it 'returns an empty string' do
        expect(@statutory_instrument_paper.year).to eq('')
      end
    end
  end

  describe '#number' do
    context 'Grom::Node has a number' do
      it 'returns the number of the Grom::Node object' do
        expect(@statutory_instrument_paper.number).to eq('538')
      end
    end

    context 'Grom::Node does not have a number' do
      it 'returns an empty string' do
        expect(@statutory_instrument_paper.number).to eq('')
      end
    end
  end

  describe '#coming_into_force_date' do
    context 'Grom::Node has a coming into force date' do
      it 'returns the coming into force date of the Grom::Node object' do
        expect(@statutory_instrument_paper.coming_into_force_date).to eq(DateTime.new(2018,06,01,0,0,0))
      end
    end

    context 'Grom::Node does not have a coming into force date' do
      it 'returns nil' do
        expect(@statutory_instrument_paper.coming_into_force_date).to eq(nil)
      end
    end
  end

  describe '#coming_into_force_note' do
    context 'Grom::Node has a coming into force note' do
      it 'returns the coming into force note of the Grom::Node object' do
        expect(@statutory_instrument_paper.coming_into_force_note).to eq('some coming into force note')
      end
    end

    context 'Grom::Node does not have a coming into force note' do
      it 'returns the an empty string' do
        expect(@statutory_instrument_paper.coming_into_force_note).to eq('')
      end
    end
  end

  describe '#weblink' do
    context 'Grom::Node has a web link' do
      it 'returns the web link of the Grom::Node object' do
        expect(@statutory_instrument_paper.weblink).to eq('http://www.legislation.gov.uk/uksi/2018/538/made')
      end
    end

    context 'Grom::Node does not have a coming into force note' do
      it 'returns the an empty string' do
        expect(@statutory_instrument_paper.weblink).to eq('')
      end
    end
  end

  describe '#work_package' do
    context 'Grom::Node has a work package' do
      it 'returns a work package Grom::Node' do
        expect(@statutory_instrument_paper.work_package.type).to eq('https://id.parliament.uk/schema/WorkPackage')
      end
    end

    context 'Grom::Node does not have a work package' do
      it 'returns nil' do
        expect(@statutory_instrument_paper.work_package).to eq(nil)
      end
    end
  end
end
