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

  describe '#clean_bitmap' do
    context 'bitmap exists' do
      before do
        allow(subject).to receive(:bitmap) { double(height: 8, width: 10) }
      end
      it 'creates a new Bitmap' do
        expect(subject.clean_bitmap).to be_a(BitmapEditor::Bitmap)
      end

      it 'new Bitmap has same dimensions as existing Bitmap' do
        subject.clean_bitmap
        expect(subject.clean_bitmap.height).to eq(8)
        expect(subject.clean_bitmap.width).to eq(10)
      end
    end

    context 'no bitmap exists' do
      it 'raises NoBitmapExistsError' do
        expect do
          subject.clean_bitmap
        end.to raise_error(BitmapEditor::NoBitmapExistsError)
      end
    end
  end
end
