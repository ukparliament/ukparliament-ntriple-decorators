require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::BusinessItem, vcr: true do
  request_object = Parliament::Request::UrlRequest.new(
    base_url:   'http://localhost:3030/api/v1',
    builder:    Parliament::Builder::NTripleResponseBuilder,
    decorators: Parliament::Grom::Decorator
  ).statutory_instrument_by_id

  let(:response) do
    request_object.get
  end

  let(:business_item) { response.filter('https://id.parliament.uk/schema/BusinessItem').first }

  # Test #procedure_step
  include_examples(
  'type_safe_first',
  {
      request:          request_object,
      filter_type:      'https://id.parliament.uk/schema/BusinessItem',
      predicate:        :businessItemHasProcedureStep,
      decorator_method: :procedure_step,
      type_klass:       Parliament::Grom::Decorator::ProcedureStep
    }
  )
  # Test #work_package
  include_examples(
    'type_safe_first',
    {
      request:          request_object,
      filter_type:      'https://id.parliament.uk/schema/BusinessItem',
      predicate:        :businessItemHasWorkPackage,
      decorator_method: :work_package,
      type_klass:       Parliament::Grom::Decorator::WorkPackage
    }
  )

  describe '#date' do
    context 'Grom::Node has a date' do
      it 'returns the date of the Grom::Node object' do
        expect(business_item.date).to eq(DateTime.new(2018, 06, 01, 0, 0, 0))
      end
    end

    context 'Grom::Node does not have a date' do
      it 'returns nil' do
        expect(business_item.date).to eq(nil)
      end
    end
  end
end
