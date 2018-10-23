require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::ProcedureStep, vcr: true do
  let(:response) do
    Parliament::Request::UrlRequest.new(
        base_url: 'http://localhost:3030/api/v1',
        builder: Parliament::Builder::NTripleResponseBuilder,
        decorators: Parliament::Grom::Decorator).procedure_step_by_id.get
  end

  let(:procedure_step) { response.filter('https://id.parliament.uk/schema/ProcedureStep').first }

  describe '#houses' do
    context 'Grom::Node has houses' do
      it 'returns an array of Grom::Nodes for the Grom::Node object' do
        expect(procedure_step.houses).to be_a Array
      end

      it 'returns an array of House Grom::Nodes for the Grom::Node object' do
        procedure_step.houses.each do |house|
          expect(house.type).to eq('https://id.parliament.uk/schema/House')
        end
      end
    end

    context 'Grom::Node does not have any houses' do
      it 'returns an empty array' do
        expect(procedure_step.houses).to eq []
      end
    end
  end

  describe '#business_items' do
    context 'Grom::Node has business items' do
      it 'returns an array of Grom::Nodes for the Grom::Node object' do
        expect(procedure_step.business_items).to be_a Array
      end

      it 'returns an array of BusinessItem Grom::Nodes for the Grom::Node object' do
        procedure_step.business_items.each do |business_item|
          expect(business_item.type).to eq('https://id.parliament.uk/schema/BusinessItem')
        end
      end
    end

    context 'Grom::Node does not have any business items' do
      it 'returns an empty array' do
        expect(procedure_step.business_items).to eq []
      end
    end
  end
end
