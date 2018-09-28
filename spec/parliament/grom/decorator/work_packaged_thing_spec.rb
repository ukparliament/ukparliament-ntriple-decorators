require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::WorkPackagedThing, vcr: true do
  request_object = Parliament::Request::UrlRequest.new(
    base_url:   'http://localhost:3030/api/v1',
    builder:    Parliament::Builder::NTripleResponseBuilder,
    decorators: Parliament::Grom::Decorator
  ).statutory_instrument_by_id

  # Test #work_package
  include_examples(
    'type_safe_first',
    {
      request:          request_object,
      filter_type:      'https://id.parliament.uk/schema/WorkPackagedThing',
      predicate:        :workPackagedThingHasWorkPackage,
      decorator_method: :work_package,
      type_klass:       Parliament::Grom::Decorator::WorkPackage
    }
  )
end