require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::LaidThing, vcr: true do
  request_object = Parliament::Request::UrlRequest.new(
    base_url:   'http://localhost:3030/api/v1',
    builder:    Parliament::Builder::NTripleResponseBuilder,
    decorators: Parliament::Grom::Decorator
  ).statutory_instrument_by_id

  # Test #body
  include_examples(
    'type_safe_first',
    {
      request:          request_object,
      filter_type:      'https://id.parliament.uk/schema/LaidThing',
      predicate:        :laidThingHasLaying,
      decorator_method: :laying,
      type_klass:       Parliament::Grom::Decorator::Laying
    }
  )
end