require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::ArticleType, vcr: true do
  before(:each) do
    id = 'asdf1234'
    response = Parliament::Request::UrlRequest.new(
      base_url: 'http://localhost:3030/api/v1',
      builder: Parliament::Builder::NTripleResponseBuilder,
      decorators: Parliament::Grom::Decorator).article_type_by_id.get
    @article_type = (response.filter('http://example.com/content/ArticleType')).first
  end

  describe '#article_type_name' do
    context 'Grom::Node has all the required objects' do
      it 'confirms that the type for this Grom::Node object is Article' do
        expect(@article_type.type).to eq('http://example.com/content/ArticleType')
      end

      it 'returns the title of the article the Grom::Node object' do
        expect(@article_type.article_type_name).to eq('article type 1')
      end
    end

    context 'Grom::Node does not have a title' do
      it 'returns an empty string' do
        expect(@article_type.article_type_name).to eq('')
      end
    end
  end
end
