require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::Question, vcr: true do
  let(:response) { Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                       builder: Parliament::Builder::NTripleResponseBuilder,
                                                       decorators: Parliament::Grom::Decorator).question_by_id.get }
  let(:question_node) { response.filter('https://id.parliament.uk/schema/Question').first }

  describe '#answers' do
    context 'Grom::Node has no answers' do
      it 'returns an empty array' do
        expect(question_node.answers).to eq([])
      end
    end

    context 'Grom::Node has all th required objects' do
      it 'returns the answers for a Grom::Node object of type Question' do
        expect(question_node.answers.size).to eq(1)
      end
    end
  end

  describe '#answering_body_allocation' do
    context 'Grom::Node has all the required objects' do
      it 'returns the answering_body_allocation for a Grom::Node object of type Question' do
        expect(question_node.answering_body_allocation.answering_body.name).to eq("Home Office")
      end
    end

    context 'Grom::Node has no answering_body_allocation' do
      it 'returns nil' do
        expect(question_node.answering_body_allocation).to eq(nil)
      end
    end
  end

  describe '#asking_person' do
    context 'Grom::Node has all the required objects' do
      it 'returns the asking_person for a Grom::Node object of type Question' do
        expect(question_node.asking_person.full_name).to eq('Heidi-Suzanne Allen')
      end
    end

    context 'Grom::Node has no asking_person' do
      it 'returns nil' do
        expect(question_node.asking_person).to eq(nil)
      end
    end
  end

  describe '#uin' do
    context 'Grom::Node has all the required objects' do
      it 'returns the uin for a Grom::Node object of type Question' do
        expect(question_node.uin).to eq('121009')
      end
    end

    context 'Grom::Node has no uin' do
      it 'returns an empty string' do
        expect(question_node.uin).to eq('')
      end
    end
  end

  describe '#text' do
    context 'Grom::Node has all the required objects' do
      it 'returns the text for a Grom::Node object of type Question' do
        expect(question_node.text).to eq('To ask the Secretary of State for the Home Department, how many people seeking family reunion with extended family members in the UK have (a) applied for and (b) been granted asylum in exceptional circumstances in each of the last three years.')
      end
    end

    context 'Grom::Node has no text' do
      it 'returns an empty string' do
        expect(question_node.text).to eq('')
      end
    end
  end

  describe '#asked_at_date' do
    context 'Grom::Node has all the required objects' do
      it 'returns the asked_at_date for a Grom::Node object of type Question' do
        expect(question_node.asked_at_date).to eq((DateTime.parse('Thu, 21 Dec 2017')))
      end
    end

    context 'Grom::Node has no asked_at_date' do
      it 'returns nil' do
        expect(question_node.asked_at_date).to eq(nil)
      end
    end
  end
end
