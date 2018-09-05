require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::AnsweringBody, vcr: true do
  let(:response) { Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                       builder: Parliament::Builder::NTripleResponseBuilder,
                                                       decorators: Parliament::Grom::Decorator).group_questions_written_answered.get }
  let(:answering_body_node) { response.filter('https://id.parliament.uk/schema/AnsweringBody').first }

  describe '#name' do
    context 'Grom::Node has a name' do
      it 'returns the name for a Grom::Node object of type AnsweringBody' do
        expect(answering_body_node.name).to eq ('Department for Transport')
      end
    end

    context 'Grom::Node has no name' do
      it 'returns an empty string' do
        expect(answering_body_node.name).to eq ('')
      end
    end
  end

  describe '#answers' do
    context 'Grom::Node has answers' do
      it 'returns the answers for a Grom::Node object of type AnsweringBody' do
        expect(answering_body_node.answers.size).to eq(50)

        answering_body_node.answers.each do |answer|
          expect(answer.type).to eq('https://id.parliament.uk/schema/Answer')
        end
      end
    end

    context 'Grom::Node does not have answers' do
      it 'returns an empty array for a Grom::Node object of type AnsweringBody' do
        expect(answering_body_node.answers).to eq([])
      end
    end
  end
end
