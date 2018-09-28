require_relative '../../../../spec_helper'

describe Parliament::Grom::Decorator::Helpers::Utils, vcr: true do
  subject(:utils) { Parliament::Grom::Decorator::Helpers::Utils }

  describe '.type_safe_first' do
    context 'Collection does not respond to #first' do
      it 'returns nil' do
        expect(utils.type_safe_first('hello', String)).to be_nil
      end
    end

    context 'Collection responds to #first' do
      context 'The first element of the collection is not the expected class' do
        it 'returns nil' do
          expect(utils.type_safe_first(['hello'], Fixnum)).to be_nil
        end
      end

      context 'The first element of the collection is the expected class' do
        it 'returns the first element' do
          expect(utils.type_safe_first(['hello'], String)).to eq('hello')
        end
      end
    end
  end
end