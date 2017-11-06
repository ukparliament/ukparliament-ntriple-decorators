RSpec.shared_examples 'date range has no start date' do
  context 'no start date' do
    it 'returns no date string' do
      expect(node).to respond_to(:date_range)
      expect(node.date_range).to eq('[Date unavailable]')
    end
  end
end

RSpec.shared_examples 'date range has no end date' do
  context 'no end date' do
    it 'returns formatted start date and correct string' do
      expect(node).to respond_to(:date_range)
      expect(node.date_range).to eq("#{node.start_date.strftime('%-e %b %Y')} to present")
    end
  end
end

RSpec.shared_examples 'date range has start and end dates' do
  context 'has start and end date' do
    it 'returns formatted start and end dates' do
      expect(node).to respond_to(:date_range)
      expect(node.date_range).to eq("#{node.start_date.strftime('%-e %b %Y')} to #{node.end_date.strftime('%-e %b %Y')}")
    end
  end
end
