require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::WorkPackage, vcr: true do
  request_object = Parliament::Request::UrlRequest.new(
    base_url:   'http://localhost:3030/api/v1',
    builder:    Parliament::Builder::NTripleResponseBuilder,
    decorators: Parliament::Grom::Decorator
  ).statutory_instrument_by_id

  # Test #procedure
  include_examples(
    'type_safe_first',
    {
      request:          request_object,
      filter_type:      'https://id.parliament.uk/schema/WorkPackage',
      predicate:        :workPackageHasProcedure,
      decorator_method: :procedure,
      type_klass:       Parliament::Grom::Decorator::Procedure
    }
  )

  # Test #business_item
  include_examples(
    'type_safe_first',
    {
      request:          request_object,
      filter_type:      'https://id.parliament.uk/schema/WorkPackage',
      predicate:        :workPackageHasBusinessItem,
      decorator_method: :business_item,
      type_klass:       Parliament::Grom::Decorator::BusinessItem
    }
  )

  # Test #work_packaged_thing
  include_examples(
      'type_safe_first',
      {
          request:          request_object,
          filter_type:      'https://id.parliament.uk/schema/WorkPackage',
          predicate:        :workPackageHasWorkPackagedThing,
          decorator_method: :work_packaged_thing,
          type_klass:       Parliament::Grom::Decorator::WorkPackagedThing
      }
  )
end
