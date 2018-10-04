RSpec.shared_examples 'type_safe_first' do |args|
  describe "##{args[:decorator_method]}" do
    let(:request) { args[:request] }
    let(:type) { args[:filter_type] }
    let(:predicate) { args[:predicate] }
    let(:decorator_method) { args[:decorator_method] }
    let(:type_klass) { args[:type_klass] }

    let(:node) { request.get.filter(type).first }

    context "node does not have #{args[:predicate]}" do
      it 'returns nil' do
        expect(node.send(decorator_method)).to eq(nil)
      end
    end

    context "node has #{args[:predicate]}" do
      context 'where it is not an enumerable' do
        it 'returns nil' do
          expect(node.send(decorator_method)).to eq(nil)
        end
      end

      context 'where it is an enumerable' do
        context "where the first item is not a #{args[:type_klass]} object" do
          it 'returns nil' do
            expect(node.send(decorator_method)).to eq(nil)
          end
        end

        context "where the first item is a #{args[:type_klass]} object" do
          it "returns the #{args[:type_klass]} object" do
            expect(node.send(decorator_method)).to be_a(type_klass)
          end
        end
      end
    end

    context "when calling ##{args[:decorator_method]} twice" do
      it 'the logic is only called once' do
        node.send(decorator_method)
        expect(node).not_to receive(predicate)
        node.send(decorator_method)
      end
    end
  end
end

