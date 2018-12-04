require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::Laying, vcr: true do
  request_object = Parliament::Request::UrlRequest.new(
    base_url:   'http://localhost:3030/api/v1',
    builder:    Parliament::Builder::NTripleResponseBuilder,
    decorators: Parliament::Grom::Decorator
  ).statutory_instrument_by_id

  let(:response) do
    request_object.get
  end

  let(:laying) {response.filter('https://id.parliament.uk/schema/Laying').first}

  # Test #body
  include_examples(
    'type_safe_first',
    {
      request:          request_object,
      filter_type:      'https://id.parliament.uk/schema/Laying',
      predicate:        :layingHasLayingBody,
      decorator_method: :body,
      type_klass:       Parliament::Grom::Decorator::Group
    }
  )

  # Test #person
  include_examples(
    'type_safe_first',
    {
      request:          request_object,
      filter_type:      'https://id.parliament.uk/schema/Laying',
      predicate:        :layingHasLayingPerson,
      decorator_method: :person,
      type_klass:       Parliament::Grom::Decorator::Person
    }
  )

  # Test #procedure_step
  include_examples(
    'type_safe_first',
    {
      request:          request_object,
      filter_type:      'https://id.parliament.uk/schema/Laying',
      predicate:        :businessItemHasProcedureStep,
      decorator_method: :procedure_step,
      type_klass:       Parliament::Grom::Decorator::ProcedureStep
    }
  )

  # Test #laid_thing
  include_examples(
      'type_safe_first',
      {
          request:          request_object,
          filter_type:      'https://id.parliament.uk/schema/Laying',
          predicate:        :layingHasLaidThing,
          decorator_method: :laid_thing,
          type_klass:       Parliament::Grom::Decorator::LaidThing
      }
  )

  describe '#date' do
    context 'Grom::Node has a date' do
      it 'returns the date of the Grom::Node object' do
        expect(laying.date).to eq(DateTime.new(2018, 05, 01, 0, 0, 0))
      end
    end

    context 'Grom::Node does not have a date' do
      it 'returns nil' do
        expect(laying.date).to eq(nil)
      end
    end
  end
end
