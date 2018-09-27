require 'spec_helper'

RSpec.describe Parliament::Grom::Decorator do
  class self::Node
    attr_accessor :type, :conceptLabel
    def initialize(type=nil)
      @type = type
    end
  end

  describe '.decorate' do
    subject(:decorator_module) { Parliament::Grom::Decorator }

    context 'with no type' do
      subject(:object) { double(:node) }

      it 'does nothing' do
        node = object

        expect(node).not_to receive(:extend)
      end
    end

    context 'with a type that has no decorator' do
      it 'does nothing' do
        node = self.class::Node.new('https://id.parliament.uk/schema/FooBar')

        expect(node).not_to receive(:extend)
      end
    end

    context 'with a single type' do
      it 'adds a single decorator' do
        node = self.class::Node.new('https://id.parliament.uk/schema/Group')

        expect(node).to receive(:extend).with(Parliament::Grom::Decorator::Group)

        decorator_module.decorate(node)
      end
    end

    context 'with multiple types' do
      it 'adds multiple decorators' do
        node = self.class::Node.new(%w(https://id.parliament.uk/schema/Group https://id.parliament.uk/schema/StatutoryInstrumentPaper))

        expect(node).to receive(:extend).with(Parliament::Grom::Decorator::Group)
        expect(node).to receive(:extend).with(Parliament::Grom::Decorator::StatutoryInstrumentPaper)

        decorator_module.decorate(node)
      end
    end
  end

  describe '.decorate_with_type' do
    subject(:decorator_module) { Parliament::Grom::Decorator }

    context 'with no type' do
      subject(:object) { double(:node) }

      it 'does nothing' do
        node = object

        expect(node).not_to receive(:extend)
      end
    end

    context 'with a type that has no decorator' do
      it 'does nothing' do
        node = self.class::Node.new('https://id.parliament.uk/schema/FooBar')

        expect(node).not_to receive(:extend)
      end
    end

    context 'with a type that has a decorator' do
      it 'adds the correct decorator' do
        node = self.class::Node.new('https://id.parliament.uk/schema/Group')

        expect(node).to receive(:extend).with(Parliament::Grom::Decorator::Group)

        decorator_module.decorate(node)
      end
    end
  end
end