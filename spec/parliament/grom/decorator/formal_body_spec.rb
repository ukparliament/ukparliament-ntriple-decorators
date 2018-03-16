require_relative '../../../spec_helper'

describe Parliament::Grom::Decorator::FormalBody, vcr: true do
  before(:each) do
    id = '43RHonMf'
    response = Parliament::Request::UrlRequest.new(base_url: 'http://localhost:3030/api/v1',
    builder: Parliament::Builder::NTripleResponseBuilder,

    
    decorators: Parliament::Grom::Decorator).person_by_id.get
 
    @formal_body_nodes = response.filter('https://id.parliament.uk/schema/FormalBody')
  end

  context '#name' do
    context 'Grom::Node has a name' do
      it 'will return correct name' do
        expect(@formal_body_nodes[0].name).to eq('Treasury Committee')

      end
    end

    context 'Grom::Node has no name' do
      it 'will return an empty string' do
        expect(@formal_body_nodes[1].name).to eq('')
      end
    end
  end

  context '#is_chair?' do
    context 'is a committee chair' do
      it 'will return true' do
        expect(@formal_body_nodes[0].is_chair?).to eq(true)
      end
    end

    context 'is not a committee chair' do
      it 'will return false' do
        expect(@formal_body_nodes[1].is_chair?).to eq(false)
      end
    end
  end

   context '#remit' do
    context 'Grom::Node has a description' do
      it 'will return correct remit' do
        expect(@formal_body_nodes[0].remit).to eq('We examine the administration, expenditure and policy of HM Treasury, HM Revenue & Customs and their associated bodies')
      end
    end

    context 'Grom::Node has no description' do
      it 'will return an empty string' do
        expect(@formal_body_nodes[1].remit).to eq('')
      end
    end
  end


  context '#start_date' do
    context 'Grom::Node has a start date' do
      it 'will return correct start date' do
        expect(@formal_body_nodes[0].start_date).to eq(DateTime.parse('1995-11-15T00:00:00+00:00'))
        expect(@formal_body_nodes[0].start_date.class).to eq(DateTime)
      end
    end

    context 'Grom::Node has no start date' do
      it 'will return nil' do
        expect(@formal_body_nodes[1].start_date).to eq(nil)
      end
    end
  end

  context '#end_date' do
    context 'Grom::Node has an end date' do
      it 'will return correct end date' do
        expect(@formal_body_nodes[0].end_date).to eq(DateTime.parse('2018-03-06T00:00:00+00:00'))
        expect(@formal_body_nodes[0].end_date.class).to eq(DateTime)
      end
    end

    context 'Grom::Node has no end date' do
      it 'will return nil' do
        expect(@formal_body_nodes[1].end_date).to eq(nil)
      end
    end
  end

  context '#current?' do
    context 'is current' do
      it 'will return true' do
        expect(@formal_body_nodes[0].current?).to eq(true)
      end
    end

    context 'is not current' do
      it 'will return false' do
        expect(@formal_body_nodes[0].current?).to eq(false)
      end
    end
  end

   context '#is_joint?' do
    context 'is a joint committee' do
      it 'will return true' do
        expect(@formal_body_nodes[0].is_joint?).to eq(true)
      end
    end

    context 'is not a joint committee' do
      it 'will return false' do
        expect(@formal_body_nodes[0].is_joint?).to eq(false)
      end
    end
  end

  describe '#date_range' do
    context 'formal body has no start_date' do
      it 'returns no date' do
        formal_body_node = @formal_body_nodes.first

        expect(formal_body_node).to respond_to(:date_range)
        expect(formal_body_node.date_range).to eq('[Date unavailable]')
      end
    end

    context 'formal body has an end date' do
      it 'returns full formatted start and end date' do
        formal_body_node = @formal_body_nodes.first

        expect(formal_body_node).to respond_to(:date_range)
        expect(formal_body_node.date_range).to eq('15 Nov 1995 to 6 Mar 2018')
      end
    end

    context 'formal body has no end date' do
      it 'returns formatted start date' do
        formal_body_node = @formal_body_nodes.first

        expect(formal_body_node).to respond_to(:date_range)
        expect(formal_body_node.date_range).to eq('15 Nov 1995 to present')
      end
    end
  end
end
