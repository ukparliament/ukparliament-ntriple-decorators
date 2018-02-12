require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::Concept, vcr: true do
  let(:response) { Parliament::Request::UrlRequest.new(
    base_url: 'http://localhost:3030/api/v1',
    builder: Parliament::Builder::NTripleResponseBuilder,
    decorators: Parliament::Grom::Decorator
    ).concept_by_id.get
  }
  let(:concept) { response.filter('https://id.parliament.uk/schema/Concept').first }

  describe '#name' do
    context 'Grom::Node has all the required objects' do
      it 'confirms that the type for this Grom::Node object is Concept' do
        expect(concept.type).to eq('https://id.parliament.uk/schema/Concept')
      end

      it 'returns the title of the Grom::Node object' do
        expect(concept.name).to eq('Oral questions')
      end
    end

    context 'Grom::Node does not have a title' do
      it 'returns an empty string' do
        expect(concept.name).to eq('')
      end
    end
  end

  describe '#description' do
    context 'Grom::Node has all the required objects' do
      it 'returns the description of the Grom::Node object' do
        expect(concept.description).to include('To include the text of answers to oral questions in your search')
      end
    end

    context 'Grom::Node does not have a description' do
      it 'returns an empty string' do
        expect(concept.description).to eq('')
      end
    end
  end

  describe '#definition' do
    context 'Grom::Node has all the required objects' do
      it 'returns the description of the Grom::Node object' do
        expect(concept.definition).to include('Questions asked to government ministers on the floor of both Houses')
      end
    end

    context 'Grom::Node does not have a description' do
      it 'returns an empty string' do
        expect(concept.definition).to eq('')
      end
    end
  end

  describe '#tagged_articles' do
    context 'Grom::Node has all the required objects' do
      it 'returns an array' do
        expect(concept.tagged_articles).to be_a(Array)
      end

      it 'returns an array of all tagged articles' do
        expect(concept.tagged_articles[0]).to be_a(Grom::Node)
        expect(concept.tagged_articles[0].type).to eq('https://id.parliament.uk/schema/WebArticle')
      end
    end

    context 'Grom::Node does not have any tagged articles' do
      it 'returns an empty array' do
        expect(concept.tagged_articles).to eq([])
      end
    end
  end

  describe '#broader_concepts' do
    context 'Grom::Node has all the required objects' do
      it 'returns an array' do
        expect(concept.broader_concepts).to be_a(Array)
      end

      it 'returns an array of Grom Nodes' do
        expect(concept.broader_concepts[0]).to be_a(Grom::Node)
      end
    end

    context 'Grom::Node does not have any parent concepts' do
      it 'returns an empty array' do
        expect(concept.broader_concepts).to eq([])
      end
    end
  end

  describe '#narrower_concepts' do
    context 'Grom::Node has all the required objects' do
      it 'returns an array' do
        expect(concept.narrower_concepts).to be_a(Array)
      end

      it 'returns an array of Grom Nodes' do
        expect(concept.narrower_concepts[0]).to be_a(Grom::Node)
      end
    end

    context 'Grom::Node does not have any child concepts' do
      it 'returns an empty array' do
        expect(concept.narrower_concepts).to eq([])
      end
    end
  end

end
