require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::Answer, vcr: true do
  let(:response) { Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                       builder: Parliament::Builder::NTripleResponseBuilder,
                                                       decorators: Parliament::Grom::Decorator).question_by_id.get }
  let(:answer_node) { response.filter('https://id.parliament.uk/schema/Answer').first }

  describe '#question' do
    let(:response) { Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
                                                         builder: Parliament::Builder::NTripleResponseBuilder,
                                                         decorators: Parliament::Grom::Decorator).group_questions_written_answered.get }
    let(:answer_node) { response.filter('https://id.parliament.uk/schema/Answer').first }

    context 'Grom::Node has the required object' do
      it 'returns the question for a Grom::Node object of type Answer' do
        expect(answer_node.question.type).to eq('https://id.parliament.uk/schema/Question')
      end
    end

    context 'Grom::Node has no question' do
      it 'returns nil' do
        expect(answer_node.question).to eq(nil)
      end
    end
  end

  describe '#answering_person' do
    context 'Grom::Node has all the required objects' do
      it 'returns the answering_person for a Grom::Node object of type Answer' do
        expect(answer_node.answering_person.full_name).to eq('Amber Rudd')
      end
    end

    context 'Grom::Node has no answering_person' do
      it 'returns nil' do
        expect(answer_node.answering_person).to eq(nil)
      end
    end
  end

  describe '#text' do
    context 'Grom::Node has all the required objects' do
      it 'returns the text for a Grom::Node object of type Answer' do
        expect(answer_node.text).to eq("<p>The Home Office does not record information in such a way to be able to report on the number of people seeking family reunion with extended family members in the UK and an individual cannot apply to be considered for family reunion under the exceptional circumstance arrangements. Instead, they would apply for Family Reunion under the Immigration Rules but, if they are refused under the Rules, the Home Office would then go on to consider whether there are exceptional circumstances.</p><p>As such, the figures for applications and visas issued under the Rules and under the exceptional circumstances arrangements are as follows:</p><p> </p><table><tbody><tr><td><p> </p></td><td><p>Total number of Family Reunion applications \u2013 age at the date of application -under 18</p></td><td><p>Total number of Family Reunion applications \u2013 age at date of application - over 18</p></td><td><p>Total number of Family Reunion visas issued (\u2018Family Other\u2019 category)</p></td><td><p>Total number of Family Reunion visas issued under exceptional circumstances arrangements</p></td></tr><tr><td><p>2015</p></td><td><p>4,980</p></td><td><p>3,220</p></td><td><p>4,887</p></td><td><p>21</p></td></tr><tr><td><p>2016</p></td><td><p>4,811</p></td><td><p>3,701</p></td><td><p>6,098</p></td><td><p>49</p></td></tr><tr><td><p>2017 (up to 30 September 2017)</p></td><td><p>2,625</p></td><td><p>2,821</p></td><td><p>3,801</p></td><td><p>49</p></td></tr></tbody></table><p>All those issued a family reunion visa are granted leave to enter or remain in the United Kingdom, not asylum. The family reunion application process does not require an assessment of the applicant\u2019s international protection needs. It is the family member in the UK that is required to have been granted refugee status or Humanitarian Protection.</p>")
      end
    end

    context 'Grom::Node has no text' do
      it 'returns an empty string' do
        expect(answer_node.text).to eq('')
      end
    end
  end

  describe '#answer_given_date' do
    context 'Grom::Node has all the required objects' do
      it 'returns the answer_given_date for a Grom::Node object of type Answer' do
        expect(answer_node.answer_given_date).to eq((DateTime.parse('Mon, 08 Jan 2018 00:00:00.000000000 +0000')))
      end
    end

    context 'Grom::Node has no answer_given_date' do
      it 'returns nil' do
        expect(answer_node.answer_given_date).to eq(nil)
      end
    end
  end
end
