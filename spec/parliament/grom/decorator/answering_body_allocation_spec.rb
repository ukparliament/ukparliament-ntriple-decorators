require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::AnsweringBodyAllocation, vcr: true do
  let(:response) { Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                       builder: Parliament::Builder::NTripleResponseBuilder,
                                                       decorators: Parliament::Grom::Decorator).question_by_id.get }
  let(:answering_body_allocation_node) { response.filter('https://id.parliament.uk/schema/AnsweringBodyAllocation').first }

  describe '#answering_body' do
    context 'Grom::Node has all the required objects' do
      it 'returns the answering_body for a Grom::Node object of type AnsweringBodyAllocation' do
        expect(answering_body_allocation_node.answering_body.name).to eq('Home Office')
      end
    end

    context 'Grom::Node has no answering_body' do
      it 'returns nil' do
        expect(answering_body_allocation_node.answering_body).to eq(nil)
      end
    end
  end
end
