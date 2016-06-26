require 'spec_helper'
require 'editor'

RSpec.describe BitmapEditor::Editor do
  describe '#run' do
    before do
      allow(subject).to receive(:gets_input) { '' }
    end

    context 'non exiting command' do
      it 'yields until exit command given' do
        allow(subject).to receive(:loop).and_yield.and_yield.and_yield
        expect(subject).to receive(:command).exactly(2).times
        allow(subject).to receive(:command).and_return(double(exit?: false), double(exit?: true))

        subject.run
      end
    end
  end

  describe '#new_bitmap' do
    it 'creates a new Bitmap' do
      expect(subject.new_bitmap(5, 5)).to be_a(BitmapEditor::Bitmap)
    end
  end
end
